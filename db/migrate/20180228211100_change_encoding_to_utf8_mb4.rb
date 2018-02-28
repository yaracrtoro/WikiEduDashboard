class ChangeEncodingToUtf8Mb4 < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;"
    execute "ALTER TABLE articles CHANGE title title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    execute "ALTER TABLE assignments CHANGE article_title article_title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
  end
  def down
    execute "ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    execute "ALTER TABLE articles CHANGE title title VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    execute "ALTER TABLE assignments CHANGE article_title article_title VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
  end
end
