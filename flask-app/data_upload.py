from models import db, TastingNote
import pandas as pd
import os
import glob
import importlib

def add_data(table_name):
    print('Get me data')
    data_location = '../sample_csvs/'
    models_module = importlib.import_module('models')

    #for file in glob.glob(os.path.join(data_location,'*.csv')):
    data_df = pd.read_csv(os.path.join(data_location, table_name + '.csv'))#file)
    data_df = data_df.to_dict(orient='records')
    
    #table_name = file.split('/')
    #table_name = table_name[len(table_name)-1]
    #table_name = table_name.split('.')[0]

    table_instance = getattr(models_module, table_name)
    
    for each_entry in data_df:#can vectorise this
        instance = table_instance(**each_entry)
        db.session.add(instance)
        db.session.commit()
        
    return ('%s data added' % table_name)