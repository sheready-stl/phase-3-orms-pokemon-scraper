class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:@db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save
      sql = <<-SQL
        INSERT INTO pokemons (name, type, @db)
        VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.type)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
  end
end
