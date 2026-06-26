


                                                #  Chapter : 06 [ Handelling Missing & Special Values]




# :: Handelling Missing Values : 

# --> three built-in functions :- 

# 1.) np.isnan --> detect missing values 
# 2.) np.nan_to_num() --> nan num ko kisi dusre num mai convert krna. 
# 3.) np.isinf() --> detecting infinite values. 


# _______________________________________________________________________________________________________________________________________




# 1. np.isnan() :
# - it gives the boolean true in the place of the index of value ,  if nan number is present in the list. 

# - Ex : 

# import numpy as np 

# arr = np.array([1 , 2 , np.nan , 4 , np.nan , 6])

# print(np.isnan(arr))  # output :  [False False  True False  True False]

# print(np.nan == np.nan)  #--> not comparable







# 2. np.nan_to_num() : 
# - it gives the functionality to change the nan number into an another given number.

# - Ex : 

# import numpy as np 

# arr = np.array([1 ,2 , np.nan , 4 , np.nan , 6])

# cleaned_arr = np.nan_to_num(arr , nan = 100)

# print(cleaned_arr) # output : [  1.   2. 100.   4. 100.   6.]






# 3. np.isinf() :
# - it gives the boolean true in the place of the index of value ,  if infinite number is present in the list. 



# - Ex : 


# import numpy as np 

# arr = np.array([1 , 2 , np.inf , 4 , -np.inf , 6])

# print(np.isinf(arr))  # output : [False False  True False  True False]



# NOTE: replacing the infinite value :





# import numpy as np 
# arr = np.array([1 , 2 , np.inf , 4 , -np.inf , 6])

# cleaned_arr = np.nan_to_num(arr , posinf=1000 , neginf=1000)

# print(cleaned_arr) # output : [   1.    2. 1000.    4. 1000.    6.]

