from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand
from data_upload import add_data
from app import app, db




migrate = Migrate(app, db)
manager = Manager(app)

manager.add_command('db', MigrateCommand)


if __name__ == '__main__':
    manager.run()