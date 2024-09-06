class PostComment
  include Interactor::Organizer
  organize PreventCommentSpam, CreateComment
end
