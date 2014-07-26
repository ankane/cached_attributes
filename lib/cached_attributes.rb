require "cached_attributes/version"

module CachedAttributes

  def self.cache
    @cache ||= defined?(::Rails) ? Rails.cache : nil
  end

  def self.cache=(cache)
    @cache = cache
  end

  module Model

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def attr_cached(*attributes)
        attributes.each do |a|
          define_method "cached_#{a}" do
            cached_attribute(a)
          end

          define_method "cache_#{a}!" do
            cache_attribute(a, send(a))
          end
        end
      end
    end

    def cache_attribute(name, value)
      CachedAttributes.cache.write([self, name], value)
      value
    end

    def cached_attribute(name)
      CachedAttributes.cache.read([self, name]) || (respond_to?(name) && cache_attribute(name, send(name))) || nil
    end

  end

end

Object.send(:include, CachedAttributes::Model)
