module SuperEnvy
  class Extender

    def initialize hash
      @hash = hash
      can_be_upgraded?
      create_accessors!

    end

    private
    def can_be_upgraded?
      raise "This object is not a hash!" unless @hash.is_a? Hash
    end

    def create_accessors!
      @hash.keys.map {|k| [k.to_s.gsub('-', '_').to_sym , k ] }.each do |name,original_key|

        puts "definiingin method: #{name}"
        puts "with keyj #{original_key}"
        puts "and value #{@hash[original_key]}"
        self.define_method(name) { @hash[original_key] }
      end
    end
  end
end
