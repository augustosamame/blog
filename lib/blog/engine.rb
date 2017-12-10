module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog
    engine_name 'blog'
  end
end
