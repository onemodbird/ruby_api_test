require "rails_helper"

RSpec.describe Article, type: :model do
  let!(:article) { create :article }
  let(:new_title) { "#{article.title} CHANGED" }

  def indexed
    Article.refresh_index!
    Article.get(article.id)
  end

  it "indexes a new article" do
    expect(indexed.fetch("id")).to eq(article.id)
  end

  it "removes a deleted article from the index" do
    article.destroy
    expect { indexed }
      .to raise_error(Elasticsearch::Transport::Transport::Errors::NotFound)
  end

  it "updates the index when an attribute changes" do
    article.update(title: new_title)
    expect(indexed.fetch("title")).to eq(new_title)
  end

  it "updates published when published_at changes" do
    expect { article.update(published_at: nil) }
      .to change{ indexed.fetch("published") }.from(true).to(false)
  end

end
