class PreventCommentSpam
  include Interactor
  def call
    user_id = context.params[:user_id]
    if spam_detection(user_id) == true
      context.fail!(error: 'Spam detected! You have to wait 2 minutes before you can leave comments.')
    else
      context.success!
    end
  end

  def spam_detection(user_id)
    redis = Redis.new(host: "localhost", port: 6379, db: 11)
    message_number = redis.get(user_id)
    if message_number == 'FROZEN'
      true
    elsif message_number.to_i >= 5
      redis.set(user_id,'FROZEN',ex:120)
      true
    else
      redis.set(user_id,message_number == nil ? 1 : message_number.to_i + 1, ex:10)
      false
    end
  end
end
