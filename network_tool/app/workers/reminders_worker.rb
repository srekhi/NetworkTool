class RemindersWorker
  include Sidekiq::Worker

  def perform(name, count)
    # do something
    #This is where job done that needs to be done in background
   
#THE BELOW IS HOW YOU CALL THIS METHOD
    #RemindersWorker.perform_async
    # https://www.youtube.com/watch?v=iIXLt24f8Mg
  end
end