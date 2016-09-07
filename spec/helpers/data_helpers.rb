module DataHelpers
  def stub_assignments_data
    allow(Assignment).to receive(:all_interactions).and_return(
      YAML.load_file(File.join(Rails.root, "spec/fixtures/assignments.yml"))["interactions"]
    )
  end

  def test_rack_file
    Rack::Test::UploadedFile.new(test_file_path)
  end

  def test_file
    File.open(test_file_path)
  end

  def test_file_path
    Rails.root.join("spec/fixtures/pixel.png")
  end

  def dirty_html
    "<h1 className=\"hidden\">Title</h1><script type=\"text/javascript\">alert('haha')</script><a href=\"http://spam.com\">Spam!</a>"
  end

  def clean_html
    "<h1>Title</h1><a href=\"http://spam.com\">Spam!</a>"
  end

end
