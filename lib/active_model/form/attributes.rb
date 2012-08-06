module ActiveModel
  class Form
    module BooleanAttribute
      def self.parse(v)
        if ['1', 't', 'true', 'yes'].include? v
          true
        elsif ['0', 'f', 'false', 'no'].include? v
          false
        elsif ['', nil].include? v
          nil
        else
          raise "Couldn't parse boolean attribute value: '#{v}'"
        end
      end

      def self.klass
        Object # Rails does that too, since Ruby doesn't have Boolean, only TrueClass/FalseClass/NilClass
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

      def self.klass
        # TODO: I suspect Rails sometimes returns Fixnum, sometimes Bignum. Investigate.
        Integer
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

      def self.klass
        Float
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

      def self.klass
        String
      end
    end

    module DateTimeAttribute
      def self.parse(v)
        if v.present?
          DateTime.new(*v)
        else
          nil
        end
      end

      def self.klass
        # Investigate when/if Rails returns Date/Time/DateTime classes
        Time
      end
    end
  end
end
