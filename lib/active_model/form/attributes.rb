module ActiveModel
  class Form
    module BooleanAttribute
      def self.parse(v)
        if ['1', 't', 'true', 'yes', true].include? v
          true
        elsif ['0', 'f', 'false', 'no', false].include? v
          false
        elsif ['', nil].include? v
          nil
        else
          raise "Couldn't parse boolean attribute value: '#{v}'"
        end
      end

      def self.type
        :boolean
      end

      def self.number?
        false
      end
    end

    module IntegerAttribute
      def self.parse(v)
        if v.present?
          Integer(v)
        elsif ['', nil].include? v
          nil
        else
          raise "Couldn't parse integer attribute value: '#{v}'"
        end
      end

      def self.type
        :integer
      end

      def self.number?
        true
      end
    end

    module FloatAttribute
      def self.parse(v)
        if v.present?
          Float(v)
        elsif ['', nil].include? v
          nil
        else
          raise "Couldn't parse float attribute value: '#{v}'"
        end
      end

      def self.type
        :float
      end

      def self.number?
        true
      end
    end

    module StringAttribute
      def self.parse(v)
        if v.present?
          String.new(v)
        elsif ['', nil].include? v
          nil
        else
          raise "Couldn't parse string attribute value: '#{v}'"
        end
      end

      def self.type
        :string
      end

      def self.number?
        false
      end

      def self.limit
        nil
      end
    end

    module DateTimeAttribute
      def self.parse(v)
        if v.compact.present?
          DateTime.new(*v)
        else
          nil
        end
      end

      def self.type
        :timestamp
      end

      def self.number?
        false
      end
    end
  end
end
