module Utility::Try
  def try
    yield rescue nil
  end

  unless Object.respond_to?(:try)
    # refer: https://apidock.com/rails/v4.2.7/Object/try
    Object.class_eval do
      def try(*a, &b)
        try!(*a, &b) if a.empty? || respond_to?(a.first)
      end

      def try!(*a, &b)
        if a.empty? && block_given?
          if b.arity == 0
            instance_eval(&b)
          else
            yield self
          end
        else
          public_send(*a, &b)
        end
      end
    end

    NilClass.class_eval do
      def try(*args)
        nil
      end

      def try!(*args)
        nil
      end
    end
  end

end

