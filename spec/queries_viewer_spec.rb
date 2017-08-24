require 'spec_helper'

describe 'queries_viewer' do
  it 'works with Ruby' do
    response_body = `ruby ruby/queries_viewer.rb`
    body = parse_json(response_body)

    expect(body[:data]).to eq(viewer: nil)
    expect(body[:errors]).to eq([
      message: "Must be authenticated to access viewer",
      locations: [line: 2, column: 5],
      path: ["viewer"]
    ])
  end

  it 'works with cURL' do
    response_body = `./curl/queries_viewer.sh`
    body = parse_json(response_body)

    expect(body[:data]).to eq(viewer: nil)
    expect(body[:errors]).to eq([
      message: "Must be authenticated to access viewer",
      locations: [line: 1, column: 27],
      path: ["viewer"]
    ])
  end
end
