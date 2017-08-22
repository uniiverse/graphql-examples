require 'spec_helper'

describe 'cURL queries_viewer' do
  it 'works' do
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
