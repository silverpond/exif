require 'exif'

def load_image(filename)
  File.expand_path("../fixtures/#{filename}", __FILE__)
end

describe Exif do
  context 'sample.jpg' do
    let(:data) { Exif::Data.new(load_image('sample.jpg')) }

    it 'has a model' do
      expect(data.model).to eq 'NIKON D600'
    end

    it 'has an image width' do
      expect(data.image_width).to eq 4000
    end

    it 'has a gps_latitude' do
      expect(data.gps_latitude).to be_within(0.0001).of(24.178028333333334)
    end

    # it 'has a date time' do
    #   expected_time = Time.new(2013, 12, 8, 21, 14, 11)
    #   expect(data.date_time).to eq expected_time
    # end
  end

  context 'sample-orientation.jpg' do
    let(:data) { Exif::Data.new(load_image('sample-orientation.jpg')) }

    it 'has an orientation' do
      expect(data.orientation).to eq 6
    end
  end
end
