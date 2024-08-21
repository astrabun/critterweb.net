module Jekyll
  module RingArrayToObjectFilter
    def ring_array_to_object(input)
      # Parse the input JSON string into an array of hashes
      parsed_input = JSON.parse(input)

      # Transform the array into an object with keys as the slug field
      result = {}
      parsed_input.each do |item|
        slug = item["slug"]
        if slug
          result[slug] = item.reject { |key| key == "slug" }
        end
      end

      # Convert the resulting object back to JSON
      JSON.pretty_generate(result)
    end
  end
end

Liquid::Template.register_filter(Jekyll::RingArrayToObjectFilter)
