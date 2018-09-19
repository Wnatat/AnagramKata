require 'anagrams'

RSpec.describe Anagrams do
  subject { described_class.new }

  context "when multiline string" do
    context "when no anagrams" do
      it "returns foo\\nbar\\nbaz for wordlist foo\\nbar\\nbaz" do
        allow(File).to receive(:read).with("wordlist.txt") { "foo\nbar\nbaz" }

        anagrams = subject.group

        expect(subject.render(anagrams)).to eq "foo\nbar\nbaz"
      end
    end

    context "when 3 anagrams" do
      it "returns foo ofo\\nbar abr \\nbaz abz" do
        allow(File).to receive(:read).with("wordlist.txt") { "foo\nbar\nbaz\nofo\nabr\nabz" }

        anagrams = subject.group

        expect(subject.render(anagrams)).to eq "foo ofo\nbar abr\nbaz abz"
      end
    end
  end

  context "when input file" do
    it "reads lines" do
      allow(File).to receive(:read).with("wordlist.txt") { "A\nB\nC" }

      expect(subject.load).to eq "A\nB\nC"
    end

    context "when anagrams from file" do
      it "counts 15919 anagrams" do
        expect(subject.group.size).to eq 15919
      end
    end
  end
end
