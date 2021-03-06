class WorkspaceDecorator < ApplicationDecorator
  delegate_all
  delegate :name, to: :user, prefix: true

  def name
    "the name is: #{object.name}"
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
