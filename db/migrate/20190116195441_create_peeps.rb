# frozen_string_literal: true

class CreatePeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.string :content
      t.string :name
      t.timestamps
    end
  end
end
