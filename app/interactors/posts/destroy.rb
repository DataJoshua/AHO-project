module Posts
  class Destroy
    include Interactor::Organizer

    organize Posts::Destroy::Execute
  end
end
