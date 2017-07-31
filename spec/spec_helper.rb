require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'
end

require 'timecop'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dayone_to_quiver'

def valid_entry_file_01 ; 'spec/fixtures/entry/valid_01.doentry' ; end
def valid_journal_file_01 ; 'spec/fixtures/journal/valid_journal_01.dayone' ; end

def expect_api_dayone_journal_to_quiver_notebook
end
