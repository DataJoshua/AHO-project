module Admins
  class Create
    include Interactor::Organizer

    organize Admins::Create::PrepareParams,
             Admins::Create::Execute
  end
end
