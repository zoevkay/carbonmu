require 'spec_helper'

describe Parser do
  class ParseTestCommand < Command
    syntax "testing_good_command"
  end

  context '.parse_and_execute' do
    it "handles a bad command" do
      expect_any_instance_of(UnknownCommand).to receive(:execute)

      subject.parse_and_execute(1, "DEFINITELY_NEVER_GOING_TO_BE_A_GOOD_COMMAND")
    end

    it "calls .execute on a good command" do
      expect_any_instance_of(ParseTestCommand).to receive(:execute)
      subject.parse_and_execute(1, "testing_good_command")
    end
  end

  context '.register_syntax' do
    it "remembers a given syntax and class" do
      class TestEmptyClass; end
      Parser.register_syntax("foo", TestEmptyClass)
      Parser.syntaxes["foo"].should eq(TestEmptyClass)
    end
  end
end