require 'sqlite3'

class DBHandler
    def initialize
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "CREATE TABLE IF NOT EXISTS Students(Lname TEXT PRIMARY KEY, Fname TEXT, Major TEXT, Email TEXT, Status TEXT);"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
    
    def create(v0,v1,v2,v3,v4)
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "INSERT INTO Students(Lname, Fname, Major, Email, Status) VALUES ('#{v0}', '#{v1}', '#{v2}', '#{v3}', '#{v4}');"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
    
    def all
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Students;"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
    
    def grad
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Students WHERE Status='Graduated';"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
    
    def notgrad
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Students WHERE Status='Not Graduated';"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
    
    
    def get(lname)
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Students WHERE Lname='#{lname}';"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
    
    
    def update(lname, val)
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "UPDATE Students SET Lname='#{val}' WHERE Lname='#{lname}';"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
    
    
    def delete(lname)
        begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "DELETE FROM Students WHERE Lname='#{lname}';"
        db.execute dbstatement
        rescue SQLite3::Exception => e
        puts"Exception Occured"
        puts e
        ensure
        db.close if db
        end
    end
end