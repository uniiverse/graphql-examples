require 'spec_helper'

describe 'queries_event' do
  it 'works with Ruby' do
    response_body = `ruby ruby/queries_event.rb`
    body = parse_json(response_body)

    expect(body[:data]).to eq(
      event: {
        title: "End of Unix Time",
        state: "POSTED",
        privacy: "PUBLIC",
        address: "17 Phoebe St, Toronto, ON M5T 1A8, Canada",
        currency: 'ERN',
        discounts: nil,
        rates: {
          nodes: [
            price: 10.0, maxQuantity: 100
          ]
        },
        timeSlots: {
          nodes: [
            startAt: "2038-01-19T00:00:00-05:00",
            endAt: "2038-01-19T01:00:00-05:00"
          ]
        }
      }
    )
    expect(body[:errors]).to eq([
      message: "Not authorized to access Event.discounts",
      locations: [line: 8, column: 7],
      path: ["event", "discounts"]
    ])
  end

  it 'works with cURL' do
    response_body = `./curl/queries_event.sh`
    body = parse_json(response_body)

    expect(body[:data]).to eq(
      event: {
        title: "End of Unix Time",
        state: "POSTED",
        privacy: "PUBLIC",
        address: "17 Phoebe St, Toronto, ON M5T 1A8, Canada",
        currency: 'ERN',
        discounts: nil,
        rates: {
          nodes: [
            price: 10.0, maxQuantity: 100
          ]
        },
        timeSlots: {
          nodes: [
            startAt: "2038-01-19T00:00:00-05:00",
            endAt: "2038-01-19T01:00:00-05:00"
          ]
        }
      }
    )
    expect(body[:errors]).to eq([
      message: "Not authorized to access Event.discounts",
      locations: [line: 1, column: 132],
      path: ["event", "discounts"]
    ])
  end
end
