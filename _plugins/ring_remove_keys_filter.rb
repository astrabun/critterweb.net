module Jekyll
  module RingRemoveKeysFilter
    def ring_remove_keys(input, keys_to_remove)
      # Parse the input JSON string into an array of hashes
      parsed_input = JSON.parse(input)

      # Remove the specified keys from each hash in the array
      parsed_input.each do |item|
        keys_to_remove.each do |key|
          item.delete(key)
        end
      end

      # Convert the modified array back to JSON
      JSON.pretty_generate(parsed_input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::RingRemoveKeysFilter)
