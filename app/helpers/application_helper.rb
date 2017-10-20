module ApplicationHelper
  require "redcarpet"
  require "coderay"

  def has_operation? operation, specification
    return false if current_user.nil?
    member = find_member(specification)
    return false if member.nil?

    operation_is_found = false
    member.roles.each do |role|
      if role.operations.find_by(name: operation)
        operation_is_found = true
        break
      end
    end
    return operation_is_found
  end

  def admin?
    current_user && current_user.admin
  end

  @@markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML,
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true

  def markdown(content)
    @@markdown.render(content).html_safe
  end

  private
    def find_member specification
      return false if current_user.nil?
      current_user.members.find_by(specification_id: specification.id)
    end

end
