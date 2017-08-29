module Kernel
  def using(resource)
    throw 'resource should respond_to dispose' unless resource.respond_to?(:dispose)

    if block_given?
      begin
        yield
      ensure
        resource.dispose
      end
    else
      # return a resource carrier
    end
  end
end
