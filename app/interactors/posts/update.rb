module Posts
  class Update
    include Interactor::Organizer

    organize Posts::Update::Execute
  end
end
