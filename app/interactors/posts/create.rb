module Posts
  class Create
    include Interactor::Organizer

    organize Posts::Create::PrepareParams,
             Posts::Create::Execute
  end
end
