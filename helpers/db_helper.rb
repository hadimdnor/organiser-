def run_sql(sql, params=[])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'organiser_db'})
    db.prepare(sql, sql)
    organiser = db.exec_prepared(sql, params)
    db.close
    return organiser
end