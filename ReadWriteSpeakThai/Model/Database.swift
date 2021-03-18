//
//  Database.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 16/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
import SQLite

class Database {

    let db: Connection!
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    init() {
        db = try! Connection("\(path)/db.sqlite3")
    }
    
    func createUser() -> Bool {
        
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        let password = Expression<String>("password")
        let coin = Expression<Int>("coin")
        
        let user = Table("user")
        
        do {
            try db.run(user.create(ifNotExists:true){
                t in
                t.column(email, primaryKey: true)
                t.column(password)
                t.column(name)
                t.column(coin)
            })
            return true
        } catch  {
            return false
        }
    }
    
    func insertUser(userInsert: User) -> Bool {
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        let password = Expression<String>("password")
        let coin = Expression<Int>("coin")
        
        let user = Table("user")
        
        do {
            let rowid = try db.run(user.insert(name <- userInsert.name, email <- userInsert.email,
                                    password <- userInsert.password, coin <- userInsert.coin))
            print("insert \(rowid)")
            return true
        } catch {
            return false
        }
    }
    
    func getUser() -> User {
        let user = Table("user")
        
        let userResult = User()
        
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        let password = Expression<String>("password")
        let coin = Expression<Int>("coin")
        
        for u in try! db.prepare(user.select(*)) {
            let email = u[email]
            let password = u[password]
            let name = u[name]
            let coin = u[coin]
            
            userResult.email = email
            userResult.password = password
            userResult.name = name
            userResult.coin = coin
        }
        
        return userResult
    }
    
    func updateUser(userUpdate: User) -> Bool{
        let user = Table("user")
        
        let name = Expression<String>("name")
        let email = Expression<String>("email")
        let password = Expression<String>("password")
        let coin = Expression<Int>("coin")
        let userNeedUpdate = user.filter(email == userUpdate.email)
        
        do {
            try! db.run(userNeedUpdate.update(coin <- userUpdate.coin))
            return true
        } catch {
            return false
        }
    }
    
    func createCategoryTable() -> Bool{
        let id = Expression<Int> ("id")
        let name = Expression<String> ("name")
        let order = Expression<Int>("order")
        
        let category = Table("category")
        do {
            try db.run(category.create(ifNotExists: true) { t in     // CREATE TABLE "users" (
                t.column(id, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
                t.column(name, unique: true)  //     "email" TEXT UNIQUE NOT NULL,
                t.column(order)                 //     "name" TEXT
            })
            return true
        } catch  {
            return false
        }
    }
    
    func createWordTable() -> Bool {
        let id = Expression<Int>("id")
        let thai = Expression<String>("thai")
        let english = Expression<String>("english")
        let tone = Expression<String>("tone")
        let simpleThai = Expression<String>("simpleThai")
        let order = Expression<Int>("order")
        let tPos = Expression<String>("tPos")
        
        let word = Table("word")
        do {
            try db.run(word.create(ifNotExists: true){ t in
                t.column(id, primaryKey: true)
                t.column(thai)
                t.column(english)
                t.column(tone)
                t.column(simpleThai)
                t.column(order)
                t.column(tPos)
            })
            return true
        } catch  {
            return false
        }
    }
    
    func createSentenceTable(){
        
    }
}
