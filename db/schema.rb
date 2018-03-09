ActiveRecord::Schema.define(version: 20180303050535) do

  enable_extension "plpgsql"

  create_table "tweets", force: :cascade do |t|
    t.text "content"
  end

end
