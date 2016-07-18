class RemindersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_contact
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!
  #ADD AUTHENTICATE BACK WHEN DONE TESTING



  # GET /reminders
  # GET /reminders.json
  def index
    if user_signed_in? 
      @reminders = @contact.reminders
    end
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    @contact = Contact.find(params[:contact_id])
    @reminder = @contact.reminders.build
    @contact.user = current_user
  end


  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = @contact.reminders.create(reminder_params)
    @contact.user = current_user

   # @reminder = @contact.reminders.create(reminder_params)
    #@diff = (@reminder.date - Date.current).abs.to_i #when you subtract two date times, you get the diff in days.
    #RemindersWorker.perform_in(@diff, @reminder.id, current_user.number)
    #RemindersWorker.set_recurring(@reminder.recurring)
    recurring = @reminder.recurring
    next_run = @reminder.next_run #THE DATE TO BE REMINDED!


      if recurring.start_with?('Not') #hardcoding this now will come back and improve.
        @reminder.interval = '0'
        RemindersWorker.perform_in(@diff.days, @reminder.id, @contact.user.phone_number, @reminder.recurring)
      elsif recurring == '1 month'
        #RemindersMonthlyWorker.perform_in(@diff.days, @reminder.id, @contact.user.phone_number, @reminder.recurring)
        @reminder.interval = recurring.first
    
      elsif recurring == '3 months'
        @reminder.interval = recurring.first
        #RemindersThreeMonthWorker.perform_in(@diff.days, @reminder.id, @contact.user.phone_number, @reminder.recurring)
      elsif recurring == '6 months'
        @reminder.interval = recurring.first

        #RemindersSixMonthWorker.perform_in(@diff.days, @reminder.id, @contact.user.phone_number, @reminder.recurring)
      elsif recurring == '1 year'
        recurring = '12 months'
        @reminder.interval = recurring.first
        #RemindersYearlyWorker.perform_in(@diff.days, @reminder.id, @contact.user.phone_number, @reminder.recurring)
      end
      

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @contact, notice: 'Reminder was successfully created.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
        redirect_to @contact
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to contact_reminder_path(@contact, @reminder), notice: 'Reminder was successfully updated.' }
        format.json { render :show, status: :ok, location: contact_reminder_path(@contact, @reminder) }
      else
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to contact_reminders_url(@contact, @reminder), notice: 'Reminder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    def set_contact #to do list
      @contact = Contact.find(params[:contact_id])
    end

    def set_reminder #to do item
      @reminder = @contact.reminders.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
       params.require(:reminder).permit(:title, :time_from_now, :send_to, :occasion, :contact_id, :date, :recurring, :interval, :next_run )
    end

    def set_recurrence(recurring)
      if recurring.start_with?('Not') #hardcoding this now will come back and improve.
      elsif recurring == '1 month'
        recurrence {monthly}
        #recurrence do 
          #going to run DateTime.current in order to tell 
          #monthly(1).
        #end
      elsif recurring == '3 months'
        recurrence {monthly(3)}
      elsif recurring == '6 months'
        recurrence {monthly(6)}
      elsif recurring == '1 year'
        recurrence {monthly(12)}
      end
      end
end
