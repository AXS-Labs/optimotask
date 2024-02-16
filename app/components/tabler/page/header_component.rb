# frozen_string_literal: true

class Tabler::Page::HeaderComponent < ApplicationComponent
  renders_one :actions
  renders_one :breadcrumb

  def initialize(title:, pretitle: nil, back_path: nil)
    @title = title
    @back_path = back_path
    @pretitle  = pretitle
  end
end
