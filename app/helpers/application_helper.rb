# frozen_string_literal: true

module ApplicationHelper
  require 'redcarpet'
  require 'coderay'
  require 'time'
  def current_user?(user)
    user == current_user
  end

  def time_present(time_date)
    time_date.strftime('%Y年 %m月%d日') unless time_date&.nil?
  end

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(';')[0].to_s

      lang =  case language
              when 'rb'
                'ruby'
              when 'yml'
                'yaml'
              when 'css'
                'css'
              when 'html'
                'html'
              when ''
                'md'
              else
                language
              end

      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text).html_safe
  end
end
