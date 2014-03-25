require "rubycritic/analysers/reek"
require "rubycritic/smell_adapters/reek"

module Rubycritic

  class AnalysersRunner
    ANALYSERS = ["Reek"]

    def initialize(paths)
      @paths = paths
    end

    def run
      smell_adapters
    end

    private

    def smell_adapters
      ANALYSERS.map do |analyser_name|
        analyser = Object.const_get("Rubycritic::Analyser::#{analyser_name}").new(@paths)
        Object.const_get("Rubycritic::SmellAdapter::#{analyser_name}").new(analyser)
      end
    end
  end

end
