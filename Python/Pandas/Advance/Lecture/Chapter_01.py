
# :: What is Pandas ?

# - Pandas is a powerful and popular Python Library designed for data manipulation(cleaning , transforming and structuring data) and data analysis ( finding patterns , trends  , and insights). 
# - it simplifies working with structured datasets like tables  , spreadsheets  , or time-series data. 




# :: what Makes Pandas Unique : 

# :--> Key Features:  
# - Works seamlessly with structured data formats like CSV and Excel. 
# - Handles missing values easily. 
# - Built on NumPy for fast computations. 






# :--> Why Use Pandas ? 

# 1. Performance : Handles millons of rows efficiently. 
# 2. Ease of use : Beginner-friendly syntax for cleaning and transforming data. 
# 3. Integration : Works with libraries like Matplotlib(visualizations) and Scikit-learn. 


# _________________________________________________________________________________________________________________________________________



# :: Series : 
# - A Series is a one-dimensional labeled array that can hold any data type: integers , floats , strings , or even Python objects. Each element in the series has a unique label called an index.
# - It is often used to track changes or patterns over time , such as daily temperatures , stock prices , or sales revenue. 









# :: DataFrame : 
# - A DataFrame is a two-dimensional labeled data structure in Pandas , similar to a table in a database , an Excel , spreadsheet  , or a SQL table. 
# - It consists of rows and columns , where: 

# a.) Rows have indices (labels)
# b.) Columns have names (labels)








# _________________________________________________________________________________________________________________________________________

# :: Read data from CSV file into a dataframe :

# import pandas as pd

# df = pd.read_csv(r"C:\Users\ANUBHAV\Data_Analytics\Pandas\Advance\Lecture\Test_data.csv")

# print(df)




# _________________________________________________________________________________________________________________________________________


# :: Save Data into csv , Excel , json file : 

# import pandas as pd 

# # import openpyxl as op


# data = {
#     "Name" : ['Ram' ,  'Shyam' , 'Ghanshyam'] , 
#     "Age" : [10 , 20 , 30] ,
#     "City" : ['Nagpur' , 'Mumbai' , 'Delhi']
    
#     }

# df = pd.DataFrame(data)
# print(df)


# df.to_csv("output.csv" , index = False)  #--> it stores the given data into the csv file

# df.to_excel("output.xlsx" , index = False) #--> it stores the given data into the xlsx file

# df.to_json("output.json" , index = False) #--> it stores the given data into the json file







# _________________________________________________________________________________________________________________________________________


# :: How to view the data in a row :
# - By using the head() , tail() method. 

# - Ex : 


# import pandas as pd 

# df = pd.read_json(r"C:\Users\ANUBHAV\Data_Analytics\Pandas\Advance\Lecture\Data\sample_Data.json")

# print('Display 10 rows of first :')
# print(df.head(10))

# print('Display 10 rows of Last :')
# print(df.tail(10))












# _________________________________________________________________________________________________________________________________________



# :: info() method : 

