# frozen_string_literal: true

json.extract! asset, :id, :created_at, :updated_at
json.url asset_url(asset, format: :json)