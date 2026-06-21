

 
                                                    # Chapter : 4 [ Reshaping & Manipulating arrays]






# :: Reshaping & Manipulating Arrays : 

# - Only structure is changed , total number of elements remain same.
# - it does not creates copy , it returns a view [affect the original array ].


"""

reshape(rows , columns) specify new shape 
if dimensions match

"""


# - Ex :  


# import numpy as np 

# arr = np.array([1,2,3,4,5,6])
# reshaped_Arr = arr.reshape(2 , 3)

# print(reshaped_Arr)
# output : 
# [[1 2 3]
#  [4 5 6]]




# ________________________________________________________________________________________________________________________________________



# :: Flattening array : 

# - it is used to converting the multidimensional array into 1D array. 


"""

.ravel() --> affect the original view. 

.flatten() --> made an copy and does not effect the original array. 

"""


# - Ex : 

# import numpy as np 


# arr_2d = np.array([ [1,2,3] , [4,5,6] ])
# print(arr_2d.ravel())  # output : [1 2 3 4 5 6]

# print(arr_2d.flatten())  # output : [1 2 3 4 5 6]




# ________________________________________________________________________________________________________________________________________




# :: Inserting element into array  : 


"""
np.insert(array , index, value , axis = None)
array - original array 
index - 
value - 
axis  - 

# NOTE : 
# - if axis = 0 , data is row-wise.
# - if axis = 1  , data is column-wise.


"""

# - Ex : 


# import numpy as np 

# arr = np.array([10 ,20 , 30 , 40 ,50 ,60])
# print(arr)  # output : [10 20 30 40 50 60]

# new_arr = np.insert(arr , 2 ,100)

# print(new_arr)  # output : [ 10  20 100  30  40  50  60]





# - Ex : [ 2D array ]

# import numpy as np 

# arr_2d = np.array([ [1,2] , [3,4] ])
# print(arr_2d)

# output: 

# [[1 2]
#  [3 4]]





#insert a new row at index 1 
# new_arr_2d = np.insert(arr_2d , 1 , [5 , 6] , axis=0)

# print(new_arr_2d)

# output :

# [[1 2]
#  [5 6]
#  [3 4]]




# axis = None will add row in a flatten way

# import numpy as np

# new_arr_2d = np.insert(arr_2d , 1 , [5 , 6] , axis=None)

# print(new_arr_2d)
# output :  [1 5 6 2 3 4]




# ________________________________________________________________________________________________________________________________________


# :: Append element into an array :
# - It is used to add an element into the end of an array. 

# - Ex : 

# import numpy as np

# arr = np.array([10 ,20 , 30])
# new_arr = np.append(arr , [40 ,50 ,60])


# print(new_arr) # output : [10 20 30 40 50 60]



# ________________________________________________________________________________________________________________________________________


# :: Concatenate two different array : 


"""
- Syntax : np.concatenate((array1 , array2) , axis = 0)

axis 0 > vertical stacking 
axis 1 > horizontal stacking 

"""

# - Ex : 

# import numpy as np 

# arr1 = np.array([1,2,3])
# arr2 = np.array([4,5,6])

# new_arr = np.concatenate((arr1, arr2))

# print(new_arr)  # output : [1 2 3 4 5 6]




# ________________________________________________________________________________________________________________________________________



# :: Removing Element for the array : 


"""

1D array :
np.delete(array , index , axis = None)

"""


# - Ex : 

# import numpy as np 

# arr = np.array([10 , 20 ,30 ,40 ,50 ,60])

# print(arr)

# new_arr = np.delete(arr , 0)

# print(new_arr)






"""

2D array :
np.delete(array , index , axis = 0)

"""


# - Ex : 



# import numpy as np 

# arr_2d = np.array([[10 , 20 ,30 ],[40 ,50 ,60]])

# print(arr_2d)
# output :

# [[10 20 30]
#  [40 50 60]]





# new_arr = np.delete(arr_2d , 0 , axis = 0)

# print(new_arr)

# output :
# [[40 50 60]]





# ________________________________________________________________________________________________________________________________________

# :: Stacking of array : 


"""
:- Types :
1. vertically stacking
2. Horizontally stacking



vstack() : row wise
hstack() : column wise


"""


# - Ex : 


# import numpy as np 

# arr1 = np.array([1,2,3])
# arr2 = np.array([4,5,6])

# print(arr1)  # output : [1 2 3]

# print(arr2)  # output : [4 5 6]


# print(np.vstack((arr1 , arr2)))   # vertically stack 
# # output : 

# # [[1 2 3]
# #  [4 5 6]]

# print(np.hstack((arr1 , arr2)))   # horizontally stack
# output : 

# [1 2 3 4 5 6]



# ________________________________________________________________________________________________________________________________________


# :: Spliting of array : 

"""

:-> Types : 

1. np.hsplit()
2. np.vsplit()



"""


# - Ex : 



# import numpy as np 

# arr = np.array([10 ,20 , 30 ,40 ,50 ,60])

# print(np.split(arr , 2))  # Output : [array([10, 20, 30]), array([40, 50, 60])]
