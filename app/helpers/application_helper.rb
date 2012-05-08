module ApplicationHelper
  def conditional_html(&block)
    lang = I18n.locale
    html = <<-"HTML".gsub( /^\s+/, '' )
      <!--[if lt IE 7 ]>    <html lang="#{lang}" class="ie ie6"> <![endif]-->
      <!--[if IE 7 ]>       <html lang="#{lang}" class="ie ie7"> <![endif]-->
      <!--[if IE 8 ]>       <html lang="#{lang}" class="ie ie8"> <![endif]-->
      <!--[if IE 9 ]>       <html lang="#{lang}" class="ie ie9"> <![endif]-->
      <!--[if (gte IE 9)|!(IE)]><!--> <html lang="#{lang}"> <!--<![endif]-->
    HTML
    html += capture( &block ) << "\n</html>".html_safe if block_given?
    html.html_safe
  end

  def restfull_action_name
    case controller.action_name.to_sym
    when :create
      'new'
    when :update
      'edit'
    else
      controller.action_name
    end
  end

  def controller_action_class
    "#{controller.controller_name}-#{restfull_action_name}"
  end

  def controller?(*controllers)
    controllers = controllers.map(&:to_sym)
    controllers.include?(controller.controller_name.to_sym)
  end
  
  def action?(*actions)
    actions = actions.map(&:to_sym)
    actions.include?(controller.action_name.to_sym)
  end

  def navigation_link_to(title, url, options = {}, &block)
    if current_page?(url) || options[:active]
      options[:class] = [options[:class], 'active'].compact.join(' ')
    end
    if options[:wrapper].present?
      content_tag options[:wrapper].to_sym, class: options[:class] do
        link_to(title, url, options, &block)
      end
    else
      link_to(title, url, options, &block)
    end
  end
end
