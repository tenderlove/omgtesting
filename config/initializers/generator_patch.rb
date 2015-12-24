# This is not complete, but I'm more interested in making Rails read this part
# than in finishing it.

module Rails
  module Generators
    class ResourceRouteGenerator < NamedBase
      def add_resource_route
        return if options[:actions].present?

        regular_class_path.each_with_index do |namespace, index|
          write("namespace :#{namespace} do", index + 1)
        end

        write("resources :#{file_name.pluralize} do", route_length + 1)
          write("member do", route_length + 2)
          write("end", route_length + 2)
          write("collection do", route_length + 2)
          write("end", route_length + 2)
        write("end", route_length + 1)

        regular_class_path.each_index do |index|
          write("end", route_length - index)
        end

        route route_string[2..-2]
      end
    end
  end
end
