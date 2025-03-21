��
��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
AvgPool

value"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype:
2
�
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

�
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

$
DisableCopyOnRead
resource�
.
Identity

input"T
output"T"	
Ttype
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_type��out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
L

StringJoin
inputs*N

output"

Nint("
	separatorstring 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "

debug_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.15.02v2.15.0-rc1-8-g6887368d6d48�
v
countVarHandleOp*
_output_shapes
: *

debug_namecount/*
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
v
totalVarHandleOp*
_output_shapes
: *

debug_nametotal/*
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
�
Adam/v/teacher_outputs/biasVarHandleOp*
_output_shapes
: *,

debug_nameAdam/v/teacher_outputs/bias/*
dtype0*
shape:*,
shared_nameAdam/v/teacher_outputs/bias
�
/Adam/v/teacher_outputs/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_outputs/bias*
_output_shapes
:*
dtype0
�
Adam/m/teacher_outputs/biasVarHandleOp*
_output_shapes
: *,

debug_nameAdam/m/teacher_outputs/bias/*
dtype0*
shape:*,
shared_nameAdam/m/teacher_outputs/bias
�
/Adam/m/teacher_outputs/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_outputs/bias*
_output_shapes
:*
dtype0
�
Adam/v/teacher_outputs/kernelVarHandleOp*
_output_shapes
: *.

debug_name Adam/v/teacher_outputs/kernel/*
dtype0*
shape:*.
shared_nameAdam/v/teacher_outputs/kernel
�
1Adam/v/teacher_outputs/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_outputs/kernel*&
_output_shapes
:*
dtype0
�
Adam/m/teacher_outputs/kernelVarHandleOp*
_output_shapes
: *.

debug_name Adam/m/teacher_outputs/kernel/*
dtype0*
shape:*.
shared_nameAdam/m/teacher_outputs/kernel
�
1Adam/m/teacher_outputs/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_outputs/kernel*&
_output_shapes
:*
dtype0
�
Adam/v/teacher_conv2d_4/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/v/teacher_conv2d_4/bias/*
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_4/bias
�
0Adam/v/teacher_conv2d_4/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_4/bias*
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_4/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/m/teacher_conv2d_4/bias/*
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_4/bias
�
0Adam/m/teacher_conv2d_4/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_4/bias*
_output_shapes
:*
dtype0
�
Adam/v/teacher_conv2d_4/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/v/teacher_conv2d_4/kernel/*
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_4/kernel
�
2Adam/v/teacher_conv2d_4/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_4/kernel*&
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_4/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/m/teacher_conv2d_4/kernel/*
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_4/kernel
�
2Adam/m/teacher_conv2d_4/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_4/kernel*&
_output_shapes
:*
dtype0
�
"Adam/v/teacher_conv_transpose/biasVarHandleOp*
_output_shapes
: *3

debug_name%#Adam/v/teacher_conv_transpose/bias/*
dtype0*
shape:*3
shared_name$"Adam/v/teacher_conv_transpose/bias
�
6Adam/v/teacher_conv_transpose/bias/Read/ReadVariableOpReadVariableOp"Adam/v/teacher_conv_transpose/bias*
_output_shapes
:*
dtype0
�
"Adam/m/teacher_conv_transpose/biasVarHandleOp*
_output_shapes
: *3

debug_name%#Adam/m/teacher_conv_transpose/bias/*
dtype0*
shape:*3
shared_name$"Adam/m/teacher_conv_transpose/bias
�
6Adam/m/teacher_conv_transpose/bias/Read/ReadVariableOpReadVariableOp"Adam/m/teacher_conv_transpose/bias*
_output_shapes
:*
dtype0
�
$Adam/v/teacher_conv_transpose/kernelVarHandleOp*
_output_shapes
: *5

debug_name'%Adam/v/teacher_conv_transpose/kernel/*
dtype0*
shape:*5
shared_name&$Adam/v/teacher_conv_transpose/kernel
�
8Adam/v/teacher_conv_transpose/kernel/Read/ReadVariableOpReadVariableOp$Adam/v/teacher_conv_transpose/kernel*&
_output_shapes
:*
dtype0
�
$Adam/m/teacher_conv_transpose/kernelVarHandleOp*
_output_shapes
: *5

debug_name'%Adam/m/teacher_conv_transpose/kernel/*
dtype0*
shape:*5
shared_name&$Adam/m/teacher_conv_transpose/kernel
�
8Adam/m/teacher_conv_transpose/kernel/Read/ReadVariableOpReadVariableOp$Adam/m/teacher_conv_transpose/kernel*&
_output_shapes
:*
dtype0
�
Adam/v/teacher_conv2d_3/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/v/teacher_conv2d_3/bias/*
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_3/bias
�
0Adam/v/teacher_conv2d_3/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_3/bias*
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_3/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/m/teacher_conv2d_3/bias/*
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_3/bias
�
0Adam/m/teacher_conv2d_3/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_3/bias*
_output_shapes
:*
dtype0
�
Adam/v/teacher_conv2d_3/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/v/teacher_conv2d_3/kernel/*
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_3/kernel
�
2Adam/v/teacher_conv2d_3/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_3/kernel*&
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_3/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/m/teacher_conv2d_3/kernel/*
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_3/kernel
�
2Adam/m/teacher_conv2d_3/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_3/kernel*&
_output_shapes
:*
dtype0
�
Adam/v/teacher_dense/biasVarHandleOp*
_output_shapes
: **

debug_nameAdam/v/teacher_dense/bias/*
dtype0*
shape:�**
shared_nameAdam/v/teacher_dense/bias
�
-Adam/v/teacher_dense/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_dense/bias*
_output_shapes	
:�*
dtype0
�
Adam/m/teacher_dense/biasVarHandleOp*
_output_shapes
: **

debug_nameAdam/m/teacher_dense/bias/*
dtype0*
shape:�**
shared_nameAdam/m/teacher_dense/bias
�
-Adam/m/teacher_dense/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_dense/bias*
_output_shapes	
:�*
dtype0
�
Adam/v/teacher_dense/kernelVarHandleOp*
_output_shapes
: *,

debug_nameAdam/v/teacher_dense/kernel/*
dtype0*
shape:	P�*,
shared_nameAdam/v/teacher_dense/kernel
�
/Adam/v/teacher_dense/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_dense/kernel*
_output_shapes
:	P�*
dtype0
�
Adam/m/teacher_dense/kernelVarHandleOp*
_output_shapes
: *,

debug_nameAdam/m/teacher_dense/kernel/*
dtype0*
shape:	P�*,
shared_nameAdam/m/teacher_dense/kernel
�
/Adam/m/teacher_dense/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_dense/kernel*
_output_shapes
:	P�*
dtype0
�
Adam/v/teacher_latent/biasVarHandleOp*
_output_shapes
: *+

debug_nameAdam/v/teacher_latent/bias/*
dtype0*
shape:P*+
shared_nameAdam/v/teacher_latent/bias
�
.Adam/v/teacher_latent/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_latent/bias*
_output_shapes
:P*
dtype0
�
Adam/m/teacher_latent/biasVarHandleOp*
_output_shapes
: *+

debug_nameAdam/m/teacher_latent/bias/*
dtype0*
shape:P*+
shared_nameAdam/m/teacher_latent/bias
�
.Adam/m/teacher_latent/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_latent/bias*
_output_shapes
:P*
dtype0
�
Adam/v/teacher_latent/kernelVarHandleOp*
_output_shapes
: *-

debug_nameAdam/v/teacher_latent/kernel/*
dtype0*
shape:	�P*-
shared_nameAdam/v/teacher_latent/kernel
�
0Adam/v/teacher_latent/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_latent/kernel*
_output_shapes
:	�P*
dtype0
�
Adam/m/teacher_latent/kernelVarHandleOp*
_output_shapes
: *-

debug_nameAdam/m/teacher_latent/kernel/*
dtype0*
shape:	�P*-
shared_nameAdam/m/teacher_latent/kernel
�
0Adam/m/teacher_latent/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_latent/kernel*
_output_shapes
:	�P*
dtype0
�
Adam/v/teacher_conv2d_2/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/v/teacher_conv2d_2/bias/*
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_2/bias
�
0Adam/v/teacher_conv2d_2/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_2/bias*
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_2/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/m/teacher_conv2d_2/bias/*
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_2/bias
�
0Adam/m/teacher_conv2d_2/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_2/bias*
_output_shapes
:*
dtype0
�
Adam/v/teacher_conv2d_2/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/v/teacher_conv2d_2/kernel/*
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_2/kernel
�
2Adam/v/teacher_conv2d_2/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_2/kernel*&
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_2/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/m/teacher_conv2d_2/kernel/*
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_2/kernel
�
2Adam/m/teacher_conv2d_2/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_2/kernel*&
_output_shapes
:*
dtype0
�
Adam/v/teacher_conv2d_1/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/v/teacher_conv2d_1/bias/*
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_1/bias
�
0Adam/v/teacher_conv2d_1/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_1/bias*
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_1/biasVarHandleOp*
_output_shapes
: *-

debug_nameAdam/m/teacher_conv2d_1/bias/*
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_1/bias
�
0Adam/m/teacher_conv2d_1/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_1/bias*
_output_shapes
:*
dtype0
�
Adam/v/teacher_conv2d_1/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/v/teacher_conv2d_1/kernel/*
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_1/kernel
�
2Adam/v/teacher_conv2d_1/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_1/kernel*&
_output_shapes
:*
dtype0
�
Adam/m/teacher_conv2d_1/kernelVarHandleOp*
_output_shapes
: */

debug_name!Adam/m/teacher_conv2d_1/kernel/*
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_1/kernel
�
2Adam/m/teacher_conv2d_1/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_1/kernel*&
_output_shapes
:*
dtype0
�
learning_rateVarHandleOp*
_output_shapes
: *

debug_namelearning_rate/*
dtype0*
shape: *
shared_namelearning_rate
g
!learning_rate/Read/ReadVariableOpReadVariableOplearning_rate*
_output_shapes
: *
dtype0
�
	iterationVarHandleOp*
_output_shapes
: *

debug_name
iteration/*
dtype0	*
shape: *
shared_name	iteration
_
iteration/Read/ReadVariableOpReadVariableOp	iteration*
_output_shapes
: *
dtype0	
�
teacher_outputs/biasVarHandleOp*
_output_shapes
: *%

debug_nameteacher_outputs/bias/*
dtype0*
shape:*%
shared_nameteacher_outputs/bias
y
(teacher_outputs/bias/Read/ReadVariableOpReadVariableOpteacher_outputs/bias*
_output_shapes
:*
dtype0
�
teacher_outputs/kernelVarHandleOp*
_output_shapes
: *'

debug_nameteacher_outputs/kernel/*
dtype0*
shape:*'
shared_nameteacher_outputs/kernel
�
*teacher_outputs/kernel/Read/ReadVariableOpReadVariableOpteacher_outputs/kernel*&
_output_shapes
:*
dtype0
�
teacher_conv2d_4/biasVarHandleOp*
_output_shapes
: *&

debug_nameteacher_conv2d_4/bias/*
dtype0*
shape:*&
shared_nameteacher_conv2d_4/bias
{
)teacher_conv2d_4/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_4/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_4/kernelVarHandleOp*
_output_shapes
: *(

debug_nameteacher_conv2d_4/kernel/*
dtype0*
shape:*(
shared_nameteacher_conv2d_4/kernel
�
+teacher_conv2d_4/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_4/kernel*&
_output_shapes
:*
dtype0
�
teacher_conv_transpose/biasVarHandleOp*
_output_shapes
: *,

debug_nameteacher_conv_transpose/bias/*
dtype0*
shape:*,
shared_nameteacher_conv_transpose/bias
�
/teacher_conv_transpose/bias/Read/ReadVariableOpReadVariableOpteacher_conv_transpose/bias*
_output_shapes
:*
dtype0
�
teacher_conv_transpose/kernelVarHandleOp*
_output_shapes
: *.

debug_name teacher_conv_transpose/kernel/*
dtype0*
shape:*.
shared_nameteacher_conv_transpose/kernel
�
1teacher_conv_transpose/kernel/Read/ReadVariableOpReadVariableOpteacher_conv_transpose/kernel*&
_output_shapes
:*
dtype0
�
teacher_conv2d_3/biasVarHandleOp*
_output_shapes
: *&

debug_nameteacher_conv2d_3/bias/*
dtype0*
shape:*&
shared_nameteacher_conv2d_3/bias
{
)teacher_conv2d_3/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_3/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_3/kernelVarHandleOp*
_output_shapes
: *(

debug_nameteacher_conv2d_3/kernel/*
dtype0*
shape:*(
shared_nameteacher_conv2d_3/kernel
�
+teacher_conv2d_3/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_3/kernel*&
_output_shapes
:*
dtype0
�
teacher_dense/biasVarHandleOp*
_output_shapes
: *#

debug_nameteacher_dense/bias/*
dtype0*
shape:�*#
shared_nameteacher_dense/bias
v
&teacher_dense/bias/Read/ReadVariableOpReadVariableOpteacher_dense/bias*
_output_shapes	
:�*
dtype0
�
teacher_dense/kernelVarHandleOp*
_output_shapes
: *%

debug_nameteacher_dense/kernel/*
dtype0*
shape:	P�*%
shared_nameteacher_dense/kernel
~
(teacher_dense/kernel/Read/ReadVariableOpReadVariableOpteacher_dense/kernel*
_output_shapes
:	P�*
dtype0
�
teacher_latent/biasVarHandleOp*
_output_shapes
: *$

debug_nameteacher_latent/bias/*
dtype0*
shape:P*$
shared_nameteacher_latent/bias
w
'teacher_latent/bias/Read/ReadVariableOpReadVariableOpteacher_latent/bias*
_output_shapes
:P*
dtype0
�
teacher_latent/kernelVarHandleOp*
_output_shapes
: *&

debug_nameteacher_latent/kernel/*
dtype0*
shape:	�P*&
shared_nameteacher_latent/kernel
�
)teacher_latent/kernel/Read/ReadVariableOpReadVariableOpteacher_latent/kernel*
_output_shapes
:	�P*
dtype0
�
teacher_conv2d_2/biasVarHandleOp*
_output_shapes
: *&

debug_nameteacher_conv2d_2/bias/*
dtype0*
shape:*&
shared_nameteacher_conv2d_2/bias
{
)teacher_conv2d_2/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_2/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_2/kernelVarHandleOp*
_output_shapes
: *(

debug_nameteacher_conv2d_2/kernel/*
dtype0*
shape:*(
shared_nameteacher_conv2d_2/kernel
�
+teacher_conv2d_2/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_2/kernel*&
_output_shapes
:*
dtype0
�
teacher_conv2d_1/biasVarHandleOp*
_output_shapes
: *&

debug_nameteacher_conv2d_1/bias/*
dtype0*
shape:*&
shared_nameteacher_conv2d_1/bias
{
)teacher_conv2d_1/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_1/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_1/kernelVarHandleOp*
_output_shapes
: *(

debug_nameteacher_conv2d_1/kernel/*
dtype0*
shape:*(
shared_nameteacher_conv2d_1/kernel
�
+teacher_conv2d_1/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_1/kernel*&
_output_shapes
:*
dtype0
�
serving_default_teacher_inputs_Placeholder*/
_output_shapes
:���������*
dtype0*$
shape:���������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_teacher_inputs_teacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_latent/kernelteacher_latent/biasteacher_dense/kernelteacher_dense/biasteacher_conv2d_3/kernelteacher_conv2d_3/biasteacher_conv_transpose/kernelteacher_conv_transpose/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_outputs/kernelteacher_outputs/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8� *0
f+R)
'__inference_signature_wrapper_100062737

NoOpNoOp
��
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*Ç
value��B�� B��
�
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer_with_weights-1
layer-5
layer-6
layer-7
	layer_with_weights-2
	layer-8

layer_with_weights-3

layer-9
layer-10
layer-11
layer_with_weights-4
layer-12
layer-13
layer_with_weights-5
layer-14
layer_with_weights-6
layer-15
layer-16
layer_with_weights-7
layer-17
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
�
	variables
trainable_variables
regularization_losses
	keras_api
 __call__
*!&call_and_return_all_conditional_losses* 
�
"	variables
#trainable_variables
$regularization_losses
%	keras_api
&__call__
*'&call_and_return_all_conditional_losses

(kernel
)bias
 *_jit_compiled_convolution_op*
�
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses* 
�
1	variables
2trainable_variables
3regularization_losses
4	keras_api
5__call__
*6&call_and_return_all_conditional_losses* 
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias
 ?_jit_compiled_convolution_op*
�
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses* 
�
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses* 
�
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses

Rkernel
Sbias*
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses

Zkernel
[bias*
�
\	variables
]trainable_variables
^regularization_losses
_	keras_api
`__call__
*a&call_and_return_all_conditional_losses* 
�
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
f__call__
*g&call_and_return_all_conditional_losses* 
�
h	variables
itrainable_variables
jregularization_losses
k	keras_api
l__call__
*m&call_and_return_all_conditional_losses

nkernel
obias
 p_jit_compiled_convolution_op*
�
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses* 
�
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{__call__
*|&call_and_return_all_conditional_losses

}kernel
~bias
 _jit_compiled_convolution_op*
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op*
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses* 
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op*
~
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
}10
~11
�12
�13
�14
�15*
~
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
}10
~11
�12
�13
�14
�15*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

�trace_0
�trace_1* 

�trace_0
�trace_1* 
* 
�
�
_variables
�_iterations
�_learning_rate
�_index_dict
�
_momentums
�_velocities
�_update_step_xla*

�serving_default* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
 __call__
*!&call_and_return_all_conditional_losses
&!"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

(0
)1*

(0
)1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
"	variables
#trainable_variables
$regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
1	variables
2trainable_variables
3regularization_losses
5__call__
*6&call_and_return_all_conditional_losses
&6"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

=0
>1*

=0
>1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_2/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_2/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

R0
S1*

R0
S1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
e_
VARIABLE_VALUEteacher_latent/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEteacher_latent/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*

Z0
[1*

Z0
[1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
d^
VARIABLE_VALUEteacher_dense/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEteacher_dense/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
\	variables
]trainable_variables
^regularization_losses
`__call__
*a&call_and_return_all_conditional_losses
&a"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
b	variables
ctrainable_variables
dregularization_losses
f__call__
*g&call_and_return_all_conditional_losses
&g"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

n0
o1*

n0
o1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
h	variables
itrainable_variables
jregularization_losses
l__call__
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_3/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_3/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

}0
~1*

}0
~1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
w	variables
xtrainable_variables
yregularization_losses
{__call__
*|&call_and_return_all_conditional_losses
&|"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
mg
VARIABLE_VALUEteacher_conv_transpose/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEteacher_conv_transpose/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 

�0
�1*

�0
�1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_4/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_4/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

�0
�1*

�0
�1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
f`
VARIABLE_VALUEteacher_outputs/kernel6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEteacher_outputs/bias4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17*

�0*
* 
* 
* 
* 
* 
* 
�
�0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12
�13
�14
�15
�16
�17
�18
�19
�20
�21
�22
�23
�24
�25
�26
�27
�28
�29
�30
�31
�32*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
�
�0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12
�13
�14
�15*
�
�0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12
�13
�14
�15*
�
�trace_0
�trace_1
�trace_2
�trace_3
�trace_4
�trace_5
�trace_6
�trace_7
�trace_8
�trace_9
�trace_10
�trace_11
�trace_12
�trace_13
�trace_14
�trace_15* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
�	variables
�	keras_api

�total

�count*
ic
VARIABLE_VALUEAdam/m/teacher_conv2d_1/kernel1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/teacher_conv2d_1/kernel1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_conv2d_1/bias1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/teacher_conv2d_1/bias1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/teacher_conv2d_2/kernel1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/teacher_conv2d_2/kernel1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_conv2d_2/bias1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/teacher_conv2d_2/bias1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_latent/kernel1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/v/teacher_latent/kernel2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUEAdam/m/teacher_latent/bias2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUEAdam/v/teacher_latent/bias2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_dense/kernel2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/teacher_dense/kernel2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEAdam/m/teacher_dense/bias2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEAdam/v/teacher_dense/bias2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/m/teacher_conv2d_3/kernel2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/teacher_conv2d_3/kernel2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/m/teacher_conv2d_3/bias2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/v/teacher_conv2d_3/bias2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUE$Adam/m/teacher_conv_transpose/kernel2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUE$Adam/v/teacher_conv_transpose/kernel2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUE"Adam/m/teacher_conv_transpose/bias2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUE"Adam/v/teacher_conv_transpose/bias2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/m/teacher_conv2d_4/kernel2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/teacher_conv2d_4/kernel2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/m/teacher_conv2d_4/bias2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/v/teacher_conv2d_4/bias2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/teacher_outputs/kernel2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/teacher_outputs/kernel2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_outputs/bias2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/teacher_outputs/bias2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

�0
�1*

�	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenameteacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_latent/kernelteacher_latent/biasteacher_dense/kernelteacher_dense/biasteacher_conv2d_3/kernelteacher_conv2d_3/biasteacher_conv_transpose/kernelteacher_conv_transpose/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_outputs/kernelteacher_outputs/bias	iterationlearning_rateAdam/m/teacher_conv2d_1/kernelAdam/v/teacher_conv2d_1/kernelAdam/m/teacher_conv2d_1/biasAdam/v/teacher_conv2d_1/biasAdam/m/teacher_conv2d_2/kernelAdam/v/teacher_conv2d_2/kernelAdam/m/teacher_conv2d_2/biasAdam/v/teacher_conv2d_2/biasAdam/m/teacher_latent/kernelAdam/v/teacher_latent/kernelAdam/m/teacher_latent/biasAdam/v/teacher_latent/biasAdam/m/teacher_dense/kernelAdam/v/teacher_dense/kernelAdam/m/teacher_dense/biasAdam/v/teacher_dense/biasAdam/m/teacher_conv2d_3/kernelAdam/v/teacher_conv2d_3/kernelAdam/m/teacher_conv2d_3/biasAdam/v/teacher_conv2d_3/bias$Adam/m/teacher_conv_transpose/kernel$Adam/v/teacher_conv_transpose/kernel"Adam/m/teacher_conv_transpose/bias"Adam/v/teacher_conv_transpose/biasAdam/m/teacher_conv2d_4/kernelAdam/v/teacher_conv2d_4/kernelAdam/m/teacher_conv2d_4/biasAdam/v/teacher_conv2d_4/biasAdam/m/teacher_outputs/kernelAdam/v/teacher_outputs/kernelAdam/m/teacher_outputs/biasAdam/v/teacher_outputs/biastotalcountConst*A
Tin:
826*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *+
f&R$
"__inference__traced_save_100063357
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameteacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_latent/kernelteacher_latent/biasteacher_dense/kernelteacher_dense/biasteacher_conv2d_3/kernelteacher_conv2d_3/biasteacher_conv_transpose/kernelteacher_conv_transpose/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_outputs/kernelteacher_outputs/bias	iterationlearning_rateAdam/m/teacher_conv2d_1/kernelAdam/v/teacher_conv2d_1/kernelAdam/m/teacher_conv2d_1/biasAdam/v/teacher_conv2d_1/biasAdam/m/teacher_conv2d_2/kernelAdam/v/teacher_conv2d_2/kernelAdam/m/teacher_conv2d_2/biasAdam/v/teacher_conv2d_2/biasAdam/m/teacher_latent/kernelAdam/v/teacher_latent/kernelAdam/m/teacher_latent/biasAdam/v/teacher_latent/biasAdam/m/teacher_dense/kernelAdam/v/teacher_dense/kernelAdam/m/teacher_dense/biasAdam/v/teacher_dense/biasAdam/m/teacher_conv2d_3/kernelAdam/v/teacher_conv2d_3/kernelAdam/m/teacher_conv2d_3/biasAdam/v/teacher_conv2d_3/bias$Adam/m/teacher_conv_transpose/kernel$Adam/v/teacher_conv_transpose/kernel"Adam/m/teacher_conv_transpose/bias"Adam/v/teacher_conv_transpose/biasAdam/m/teacher_conv2d_4/kernelAdam/v/teacher_conv2d_4/kernelAdam/m/teacher_conv2d_4/biasAdam/v/teacher_conv2d_4/biasAdam/m/teacher_outputs/kernelAdam/v/teacher_outputs/kernelAdam/m/teacher_outputs/biasAdam/v/teacher_outputs/biastotalcount*@
Tin9
725*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *.
f)R'
%__inference__traced_restore_100063522��
�
N
2__inference_teacher_relu_3_layer_call_fn_100062898

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062401h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_teacher_conv2d_2_layer_call_fn_100062804

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062332w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062800:)%
#
_user_specified_name	100062798:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�

�
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062438

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
3__inference_teacher_outputs_layer_call_fn_100063012

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100062460w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100063008:)%
#
_user_specified_name	100063006:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062874

inputs1
matmul_readvariableop_resource:	P�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:����������S
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������P: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:O K
'
_output_shapes
:���������P
 
_user_specified_nameinputs
�

�
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062993

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
4__inference_teacher_conv2d_1_layer_call_fn_100062765

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062310w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062761:)%
#
_user_specified_name	100062759:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
i
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062824

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
i
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062932

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
j
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062299

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
'__inference_signature_wrapper_100062737
teacher_inputs_!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallteacher_inputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8� *-
f(R&
$__inference__wrapped_model_100062231w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062733:)%
#
_user_specified_name	100062731:)%
#
_user_specified_name	100062729:)%
#
_user_specified_name	100062727:)%
#
_user_specified_name	100062725:)%
#
_user_specified_name	100062723:)
%
#
_user_specified_name	100062721:)	%
#
_user_specified_name	100062719:)%
#
_user_specified_name	100062717:)%
#
_user_specified_name	100062715:)%
#
_user_specified_name	100062713:)%
#
_user_specified_name	100062711:)%
#
_user_specified_name	100062709:)%
#
_user_specified_name	100062707:)%
#
_user_specified_name	100062705:)%
#
_user_specified_name	100062703:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
K
#__inference__update_step_xla_842934
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:($
"
_user_specified_name
variable:D @

_output_shapes
:
"
_user_specified_name
gradient
�
�
5__inference_teacher-transpose_layer_call_fn_100062557
teacher_inputs_!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallteacher_inputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8� *Y
fTRR
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062467w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062553:)%
#
_user_specified_name	100062551:)%
#
_user_specified_name	100062549:)%
#
_user_specified_name	100062547:)%
#
_user_specified_name	100062545:)%
#
_user_specified_name	100062543:)
%
#
_user_specified_name	100062541:)	%
#
_user_specified_name	100062539:)%
#
_user_specified_name	100062537:)%
#
_user_specified_name	100062535:)%
#
_user_specified_name	100062533:)%
#
_user_specified_name	100062531:)%
#
_user_specified_name	100062529:)%
#
_user_specified_name	100062527:)%
#
_user_specified_name	100062525:)%
#
_user_specified_name	100062523:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
L
#__inference__update_step_xla_842924
gradient
variable:	�*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes
	:�: *
	_noinline(:($
"
_user_specified_name
variable:E A

_output_shapes	
:�
"
_user_specified_name
gradient
�
i
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062320

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
N
2__inference_teacher_relu_4_layer_call_fn_100062927

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062422h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
i
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100062448

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
i
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062236

inputs
identity�
AvgPoolAvgPoolinputs*
T0*J
_output_shapes8
6:4������������������������������������*
ksize
*
paddingVALID*
strides
{
IdentityIdentityAvgPool:output:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�
K
#__inference__update_step_xla_842904
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:($
"
_user_specified_name
variable:D @

_output_shapes
:
"
_user_specified_name
gradient
�

�
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062775

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
N
2__inference_teacher_relu_2_layer_call_fn_100062819

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062342h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�Q
�	
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062467
teacher_inputs_4
teacher_conv2d_1_100062311:(
teacher_conv2d_1_100062313:4
teacher_conv2d_2_100062333:(
teacher_conv2d_2_100062335:+
teacher_latent_100062362:	�P&
teacher_latent_100062364:P*
teacher_dense_100062377:	P�&
teacher_dense_100062379:	�4
teacher_conv2d_3_100062413:(
teacher_conv2d_3_100062415::
 teacher_conv_transpose_100062424:.
 teacher_conv_transpose_100062426:4
teacher_conv2d_4_100062439:(
teacher_conv2d_4_100062441:3
teacher_outputs_100062461:'
teacher_outputs_100062463:
identity��(teacher_conv2d_1/StatefulPartitionedCall�(teacher_conv2d_2/StatefulPartitionedCall�(teacher_conv2d_3/StatefulPartitionedCall�(teacher_conv2d_4/StatefulPartitionedCall�.teacher_conv_transpose/StatefulPartitionedCall�%teacher_dense/StatefulPartitionedCall�&teacher_latent/StatefulPartitionedCall�'teacher_outputs/StatefulPartitionedCall�
teacher_reshape/PartitionedCallPartitionedCallteacher_inputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062299�
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_conv2d_1_100062311teacher_conv2d_1_100062313*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062310�
teacher_relu_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062320�
teacher_pool_1/PartitionedCallPartitionedCall'teacher_relu_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062236�
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall'teacher_pool_1/PartitionedCall:output:0teacher_conv2d_2_100062333teacher_conv2d_2_100062335*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062332�
teacher_relu_2/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062342�
teacher_flatten/PartitionedCallPartitionedCall'teacher_relu_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062349�
&teacher_latent/StatefulPartitionedCallStatefulPartitionedCall(teacher_flatten/PartitionedCall:output:0teacher_latent_100062362teacher_latent_100062364*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062361�
%teacher_dense/StatefulPartitionedCallStatefulPartitionedCall/teacher_latent/StatefulPartitionedCall:output:0teacher_dense_100062377teacher_dense_100062379*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *U
fPRN
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062376�
 teacher_reshape2/PartitionedCallPartitionedCall.teacher_dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062395�
teacher_relu_3/PartitionedCallPartitionedCall)teacher_reshape2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062401�
(teacher_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_3/PartitionedCall:output:0teacher_conv2d_3_100062413teacher_conv2d_3_100062415*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062412�
teacher_relu_4/PartitionedCallPartitionedCall1teacher_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062422�
.teacher_conv_transpose/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_4/PartitionedCall:output:0 teacher_conv_transpose_100062424 teacher_conv_transpose_100062426*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *^
fYRW
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062274�
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall7teacher_conv_transpose/StatefulPartitionedCall:output:0teacher_conv2d_4_100062439teacher_conv2d_4_100062441*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062438�
teacher_relu_5/PartitionedCallPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100062448�
'teacher_outputs/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_5/PartitionedCall:output:0teacher_outputs_100062461teacher_outputs_100062463*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100062460�
IdentityIdentity0teacher_outputs/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:����������
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_3/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall/^teacher_conv_transpose/StatefulPartitionedCall&^teacher_dense/StatefulPartitionedCall'^teacher_latent/StatefulPartitionedCall(^teacher_outputs/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������: : : : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_3/StatefulPartitionedCall(teacher_conv2d_3/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2`
.teacher_conv_transpose/StatefulPartitionedCall.teacher_conv_transpose/StatefulPartitionedCall2N
%teacher_dense/StatefulPartitionedCall%teacher_dense/StatefulPartitionedCall2P
&teacher_latent/StatefulPartitionedCall&teacher_latent/StatefulPartitionedCall2R
'teacher_outputs/StatefulPartitionedCall'teacher_outputs/StatefulPartitionedCall:)%
#
_user_specified_name	100062463:)%
#
_user_specified_name	100062461:)%
#
_user_specified_name	100062441:)%
#
_user_specified_name	100062439:)%
#
_user_specified_name	100062426:)%
#
_user_specified_name	100062424:)
%
#
_user_specified_name	100062415:)	%
#
_user_specified_name	100062413:)%
#
_user_specified_name	100062379:)%
#
_user_specified_name	100062377:)%
#
_user_specified_name	100062364:)%
#
_user_specified_name	100062362:)%
#
_user_specified_name	100062335:)%
#
_user_specified_name	100062333:)%
#
_user_specified_name	100062313:)%
#
_user_specified_name	100062311:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�Q
�	
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062520
teacher_inputs_4
teacher_conv2d_1_100062471:(
teacher_conv2d_1_100062473:4
teacher_conv2d_2_100062478:(
teacher_conv2d_2_100062480:+
teacher_latent_100062485:	�P&
teacher_latent_100062487:P*
teacher_dense_100062490:	P�&
teacher_dense_100062492:	�4
teacher_conv2d_3_100062497:(
teacher_conv2d_3_100062499::
 teacher_conv_transpose_100062503:.
 teacher_conv_transpose_100062505:4
teacher_conv2d_4_100062508:(
teacher_conv2d_4_100062510:3
teacher_outputs_100062514:'
teacher_outputs_100062516:
identity��(teacher_conv2d_1/StatefulPartitionedCall�(teacher_conv2d_2/StatefulPartitionedCall�(teacher_conv2d_3/StatefulPartitionedCall�(teacher_conv2d_4/StatefulPartitionedCall�.teacher_conv_transpose/StatefulPartitionedCall�%teacher_dense/StatefulPartitionedCall�&teacher_latent/StatefulPartitionedCall�'teacher_outputs/StatefulPartitionedCall�
teacher_reshape/PartitionedCallPartitionedCallteacher_inputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062299�
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_conv2d_1_100062471teacher_conv2d_1_100062473*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062310�
teacher_relu_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062320�
teacher_pool_1/PartitionedCallPartitionedCall'teacher_relu_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062236�
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall'teacher_pool_1/PartitionedCall:output:0teacher_conv2d_2_100062478teacher_conv2d_2_100062480*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062332�
teacher_relu_2/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062342�
teacher_flatten/PartitionedCallPartitionedCall'teacher_relu_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062349�
&teacher_latent/StatefulPartitionedCallStatefulPartitionedCall(teacher_flatten/PartitionedCall:output:0teacher_latent_100062485teacher_latent_100062487*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062361�
%teacher_dense/StatefulPartitionedCallStatefulPartitionedCall/teacher_latent/StatefulPartitionedCall:output:0teacher_dense_100062490teacher_dense_100062492*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *U
fPRN
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062376�
 teacher_reshape2/PartitionedCallPartitionedCall.teacher_dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062395�
teacher_relu_3/PartitionedCallPartitionedCall)teacher_reshape2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062401�
(teacher_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_3/PartitionedCall:output:0teacher_conv2d_3_100062497teacher_conv2d_3_100062499*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062412�
teacher_relu_4/PartitionedCallPartitionedCall1teacher_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062422�
.teacher_conv_transpose/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_4/PartitionedCall:output:0 teacher_conv_transpose_100062503 teacher_conv_transpose_100062505*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *^
fYRW
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062274�
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall7teacher_conv_transpose/StatefulPartitionedCall:output:0teacher_conv2d_4_100062508teacher_conv2d_4_100062510*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062438�
teacher_relu_5/PartitionedCallPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100062448�
'teacher_outputs/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_5/PartitionedCall:output:0teacher_outputs_100062514teacher_outputs_100062516*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100062460�
IdentityIdentity0teacher_outputs/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:����������
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_3/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall/^teacher_conv_transpose/StatefulPartitionedCall&^teacher_dense/StatefulPartitionedCall'^teacher_latent/StatefulPartitionedCall(^teacher_outputs/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������: : : : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_3/StatefulPartitionedCall(teacher_conv2d_3/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2`
.teacher_conv_transpose/StatefulPartitionedCall.teacher_conv_transpose/StatefulPartitionedCall2N
%teacher_dense/StatefulPartitionedCall%teacher_dense/StatefulPartitionedCall2P
&teacher_latent/StatefulPartitionedCall&teacher_latent/StatefulPartitionedCall2R
'teacher_outputs/StatefulPartitionedCall'teacher_outputs/StatefulPartitionedCall:)%
#
_user_specified_name	100062516:)%
#
_user_specified_name	100062514:)%
#
_user_specified_name	100062510:)%
#
_user_specified_name	100062508:)%
#
_user_specified_name	100062505:)%
#
_user_specified_name	100062503:)
%
#
_user_specified_name	100062499:)	%
#
_user_specified_name	100062497:)%
#
_user_specified_name	100062492:)%
#
_user_specified_name	100062490:)%
#
_user_specified_name	100062487:)%
#
_user_specified_name	100062485:)%
#
_user_specified_name	100062480:)%
#
_user_specified_name	100062478:)%
#
_user_specified_name	100062473:)%
#
_user_specified_name	100062471:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
K
#__inference__update_step_xla_842914
gradient
variable:P*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:P: *
	_noinline(:($
"
_user_specified_name
variable:D @

_output_shapes
:P
"
_user_specified_name
gradient
�
W
#__inference__update_step_xla_842929
gradient"
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:: *
	_noinline(:($
"
_user_specified_name
variable:P L
&
_output_shapes
:
"
_user_specified_name
gradient
�
K
#__inference__update_step_xla_842954
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:($
"
_user_specified_name
variable:D @

_output_shapes
:
"
_user_specified_name
gradient
�
�
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100062460

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062412

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
i
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062903

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
i
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062795

inputs
identity�
AvgPoolAvgPoolinputs*
T0*J
_output_shapes8
6:4������������������������������������*
ksize
*
paddingVALID*
strides
{
IdentityIdentityAvgPool:output:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�
P
#__inference__update_step_xla_842909
gradient
variable:	�P*
_XlaMustCompile(*(
_construction_contextkEagerRuntime* 
_input_shapes
:	�P: *
	_noinline(:($
"
_user_specified_name
variable:I E

_output_shapes
:	�P
"
_user_specified_name
gradient
�
i
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062785

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
O
3__inference_teacher_reshape_layer_call_fn_100062742

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062299h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
W
#__inference__update_step_xla_842959
gradient"
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:: *
	_noinline(:($
"
_user_specified_name
variable:P L
&
_output_shapes
:
"
_user_specified_name
gradient
�
k
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062395

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������	`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
K
#__inference__update_step_xla_842894
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:($
"
_user_specified_name
variable:D @

_output_shapes
:
"
_user_specified_name
gradient
�
K
#__inference__update_step_xla_842944
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:($
"
_user_specified_name
variable:D @

_output_shapes
:
"
_user_specified_name
gradient
�!
�
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062974

inputsB
(conv2d_transpose_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������]
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
k
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062893

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������	`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062814

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�

�
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062855

inputs1
matmul_readvariableop_resource:	�P-
biasadd_readvariableop_resource:P
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Pr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:P*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������PP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Pa
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������PS
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
W
#__inference__update_step_xla_842939
gradient"
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:: *
	_noinline(:($
"
_user_specified_name
variable:P L
&
_output_shapes
:
"
_user_specified_name
gradient
�
i
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062422

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
j
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062349

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
i
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062342

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
N
2__inference_teacher_relu_1_layer_call_fn_100062780

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062320h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�!
�
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062274

inputsB
(conv2d_transpose_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������]
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
P
4__inference_teacher_reshape2_layer_call_fn_100062879

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062395h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062361

inputs1
matmul_readvariableop_resource:	�P-
biasadd_readvariableop_resource:P
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Pr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:P*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������PP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Pa
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������PS
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062310

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
:__inference_teacher_conv_transpose_layer_call_fn_100062941

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *^
fYRW
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062274�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062937:)%
#
_user_specified_name	100062935:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
��
�$
%__inference__traced_restore_100063522
file_prefixB
(assignvariableop_teacher_conv2d_1_kernel:6
(assignvariableop_1_teacher_conv2d_1_bias:D
*assignvariableop_2_teacher_conv2d_2_kernel:6
(assignvariableop_3_teacher_conv2d_2_bias:;
(assignvariableop_4_teacher_latent_kernel:	�P4
&assignvariableop_5_teacher_latent_bias:P:
'assignvariableop_6_teacher_dense_kernel:	P�4
%assignvariableop_7_teacher_dense_bias:	�D
*assignvariableop_8_teacher_conv2d_3_kernel:6
(assignvariableop_9_teacher_conv2d_3_bias:K
1assignvariableop_10_teacher_conv_transpose_kernel:=
/assignvariableop_11_teacher_conv_transpose_bias:E
+assignvariableop_12_teacher_conv2d_4_kernel:7
)assignvariableop_13_teacher_conv2d_4_bias:D
*assignvariableop_14_teacher_outputs_kernel:6
(assignvariableop_15_teacher_outputs_bias:'
assignvariableop_16_iteration:	 +
!assignvariableop_17_learning_rate: L
2assignvariableop_18_adam_m_teacher_conv2d_1_kernel:L
2assignvariableop_19_adam_v_teacher_conv2d_1_kernel:>
0assignvariableop_20_adam_m_teacher_conv2d_1_bias:>
0assignvariableop_21_adam_v_teacher_conv2d_1_bias:L
2assignvariableop_22_adam_m_teacher_conv2d_2_kernel:L
2assignvariableop_23_adam_v_teacher_conv2d_2_kernel:>
0assignvariableop_24_adam_m_teacher_conv2d_2_bias:>
0assignvariableop_25_adam_v_teacher_conv2d_2_bias:C
0assignvariableop_26_adam_m_teacher_latent_kernel:	�PC
0assignvariableop_27_adam_v_teacher_latent_kernel:	�P<
.assignvariableop_28_adam_m_teacher_latent_bias:P<
.assignvariableop_29_adam_v_teacher_latent_bias:PB
/assignvariableop_30_adam_m_teacher_dense_kernel:	P�B
/assignvariableop_31_adam_v_teacher_dense_kernel:	P�<
-assignvariableop_32_adam_m_teacher_dense_bias:	�<
-assignvariableop_33_adam_v_teacher_dense_bias:	�L
2assignvariableop_34_adam_m_teacher_conv2d_3_kernel:L
2assignvariableop_35_adam_v_teacher_conv2d_3_kernel:>
0assignvariableop_36_adam_m_teacher_conv2d_3_bias:>
0assignvariableop_37_adam_v_teacher_conv2d_3_bias:R
8assignvariableop_38_adam_m_teacher_conv_transpose_kernel:R
8assignvariableop_39_adam_v_teacher_conv_transpose_kernel:D
6assignvariableop_40_adam_m_teacher_conv_transpose_bias:D
6assignvariableop_41_adam_v_teacher_conv_transpose_bias:L
2assignvariableop_42_adam_m_teacher_conv2d_4_kernel:L
2assignvariableop_43_adam_v_teacher_conv2d_4_kernel:>
0assignvariableop_44_adam_m_teacher_conv2d_4_bias:>
0assignvariableop_45_adam_v_teacher_conv2d_4_bias:K
1assignvariableop_46_adam_m_teacher_outputs_kernel:K
1assignvariableop_47_adam_v_teacher_outputs_kernel:=
/assignvariableop_48_adam_m_teacher_outputs_bias:=
/assignvariableop_49_adam_v_teacher_outputs_bias:#
assignvariableop_50_total: #
assignvariableop_51_count: 
identity_53��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_44�AssignVariableOp_45�AssignVariableOp_46�AssignVariableOp_47�AssignVariableOp_48�AssignVariableOp_49�AssignVariableOp_5�AssignVariableOp_50�AssignVariableOp_51�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:5*
dtype0*�
value�B�5B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:5*
dtype0*}
valuetBr5B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�:::::::::::::::::::::::::::::::::::::::::::::::::::::*C
dtypes9
725	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp(assignvariableop_teacher_conv2d_1_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp(assignvariableop_1_teacher_conv2d_1_biasIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp*assignvariableop_2_teacher_conv2d_2_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp(assignvariableop_3_teacher_conv2d_2_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp(assignvariableop_4_teacher_latent_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp&assignvariableop_5_teacher_latent_biasIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp'assignvariableop_6_teacher_dense_kernelIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp%assignvariableop_7_teacher_dense_biasIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp*assignvariableop_8_teacher_conv2d_3_kernelIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp(assignvariableop_9_teacher_conv2d_3_biasIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp1assignvariableop_10_teacher_conv_transpose_kernelIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp/assignvariableop_11_teacher_conv_transpose_biasIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp+assignvariableop_12_teacher_conv2d_4_kernelIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOp)assignvariableop_13_teacher_conv2d_4_biasIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOp*assignvariableop_14_teacher_outputs_kernelIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOp(assignvariableop_15_teacher_outputs_biasIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_16AssignVariableOpassignvariableop_16_iterationIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOp!assignvariableop_17_learning_rateIdentity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp2assignvariableop_18_adam_m_teacher_conv2d_1_kernelIdentity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOp2assignvariableop_19_adam_v_teacher_conv2d_1_kernelIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOp0assignvariableop_20_adam_m_teacher_conv2d_1_biasIdentity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp0assignvariableop_21_adam_v_teacher_conv2d_1_biasIdentity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp2assignvariableop_22_adam_m_teacher_conv2d_2_kernelIdentity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp2assignvariableop_23_adam_v_teacher_conv2d_2_kernelIdentity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp0assignvariableop_24_adam_m_teacher_conv2d_2_biasIdentity_24:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp0assignvariableop_25_adam_v_teacher_conv2d_2_biasIdentity_25:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp0assignvariableop_26_adam_m_teacher_latent_kernelIdentity_26:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp0assignvariableop_27_adam_v_teacher_latent_kernelIdentity_27:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp.assignvariableop_28_adam_m_teacher_latent_biasIdentity_28:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp.assignvariableop_29_adam_v_teacher_latent_biasIdentity_29:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp/assignvariableop_30_adam_m_teacher_dense_kernelIdentity_30:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp/assignvariableop_31_adam_v_teacher_dense_kernelIdentity_31:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp-assignvariableop_32_adam_m_teacher_dense_biasIdentity_32:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOp-assignvariableop_33_adam_v_teacher_dense_biasIdentity_33:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOp2assignvariableop_34_adam_m_teacher_conv2d_3_kernelIdentity_34:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOp2assignvariableop_35_adam_v_teacher_conv2d_3_kernelIdentity_35:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOp0assignvariableop_36_adam_m_teacher_conv2d_3_biasIdentity_36:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOp0assignvariableop_37_adam_v_teacher_conv2d_3_biasIdentity_37:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOp8assignvariableop_38_adam_m_teacher_conv_transpose_kernelIdentity_38:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOp8assignvariableop_39_adam_v_teacher_conv_transpose_kernelIdentity_39:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_40AssignVariableOp6assignvariableop_40_adam_m_teacher_conv_transpose_biasIdentity_40:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_41AssignVariableOp6assignvariableop_41_adam_v_teacher_conv_transpose_biasIdentity_41:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_42AssignVariableOp2assignvariableop_42_adam_m_teacher_conv2d_4_kernelIdentity_42:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_43AssignVariableOp2assignvariableop_43_adam_v_teacher_conv2d_4_kernelIdentity_43:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_44AssignVariableOp0assignvariableop_44_adam_m_teacher_conv2d_4_biasIdentity_44:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_45AssignVariableOp0assignvariableop_45_adam_v_teacher_conv2d_4_biasIdentity_45:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_46AssignVariableOp1assignvariableop_46_adam_m_teacher_outputs_kernelIdentity_46:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_47AssignVariableOp1assignvariableop_47_adam_v_teacher_outputs_kernelIdentity_47:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_48AssignVariableOp/assignvariableop_48_adam_m_teacher_outputs_biasIdentity_48:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_49AssignVariableOp/assignvariableop_49_adam_v_teacher_outputs_biasIdentity_49:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_50AssignVariableOpassignvariableop_50_totalIdentity_50:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_51AssignVariableOpassignvariableop_51_countIdentity_51:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 �	
Identity_52Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_53IdentityIdentity_52:output:0^NoOp_1*
T0*
_output_shapes
: �	
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
_output_shapes
 "#
identity_53Identity_53:output:0*(
_construction_contextkEagerRuntime*}
_input_shapesl
j: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_92$
AssignVariableOpAssignVariableOp:%4!

_user_specified_namecount:%3!

_user_specified_nametotal:;27
5
_user_specified_nameAdam/v/teacher_outputs/bias:;17
5
_user_specified_nameAdam/m/teacher_outputs/bias:=09
7
_user_specified_nameAdam/v/teacher_outputs/kernel:=/9
7
_user_specified_nameAdam/m/teacher_outputs/kernel:<.8
6
_user_specified_nameAdam/v/teacher_conv2d_4/bias:<-8
6
_user_specified_nameAdam/m/teacher_conv2d_4/bias:>,:
8
_user_specified_name Adam/v/teacher_conv2d_4/kernel:>+:
8
_user_specified_name Adam/m/teacher_conv2d_4/kernel:B*>
<
_user_specified_name$"Adam/v/teacher_conv_transpose/bias:B)>
<
_user_specified_name$"Adam/m/teacher_conv_transpose/bias:D(@
>
_user_specified_name&$Adam/v/teacher_conv_transpose/kernel:D'@
>
_user_specified_name&$Adam/m/teacher_conv_transpose/kernel:<&8
6
_user_specified_nameAdam/v/teacher_conv2d_3/bias:<%8
6
_user_specified_nameAdam/m/teacher_conv2d_3/bias:>$:
8
_user_specified_name Adam/v/teacher_conv2d_3/kernel:>#:
8
_user_specified_name Adam/m/teacher_conv2d_3/kernel:9"5
3
_user_specified_nameAdam/v/teacher_dense/bias:9!5
3
_user_specified_nameAdam/m/teacher_dense/bias:; 7
5
_user_specified_nameAdam/v/teacher_dense/kernel:;7
5
_user_specified_nameAdam/m/teacher_dense/kernel::6
4
_user_specified_nameAdam/v/teacher_latent/bias::6
4
_user_specified_nameAdam/m/teacher_latent/bias:<8
6
_user_specified_nameAdam/v/teacher_latent/kernel:<8
6
_user_specified_nameAdam/m/teacher_latent/kernel:<8
6
_user_specified_nameAdam/v/teacher_conv2d_2/bias:<8
6
_user_specified_nameAdam/m/teacher_conv2d_2/bias:>:
8
_user_specified_name Adam/v/teacher_conv2d_2/kernel:>:
8
_user_specified_name Adam/m/teacher_conv2d_2/kernel:<8
6
_user_specified_nameAdam/v/teacher_conv2d_1/bias:<8
6
_user_specified_nameAdam/m/teacher_conv2d_1/bias:>:
8
_user_specified_name Adam/v/teacher_conv2d_1/kernel:>:
8
_user_specified_name Adam/m/teacher_conv2d_1/kernel:-)
'
_user_specified_namelearning_rate:)%
#
_user_specified_name	iteration:40
.
_user_specified_nameteacher_outputs/bias:62
0
_user_specified_nameteacher_outputs/kernel:51
/
_user_specified_nameteacher_conv2d_4/bias:73
1
_user_specified_nameteacher_conv2d_4/kernel:;7
5
_user_specified_nameteacher_conv_transpose/bias:=9
7
_user_specified_nameteacher_conv_transpose/kernel:5
1
/
_user_specified_nameteacher_conv2d_3/bias:7	3
1
_user_specified_nameteacher_conv2d_3/kernel:2.
,
_user_specified_nameteacher_dense/bias:40
.
_user_specified_nameteacher_dense/kernel:3/
-
_user_specified_nameteacher_latent/bias:51
/
_user_specified_nameteacher_latent/kernel:51
/
_user_specified_nameteacher_conv2d_2/bias:73
1
_user_specified_nameteacher_conv2d_2/kernel:51
/
_user_specified_nameteacher_conv2d_1/bias:73
1
_user_specified_nameteacher_conv2d_1/kernel:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
j
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062756

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062332

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�3
"__inference__traced_save_100063357
file_prefixH
.read_disablecopyonread_teacher_conv2d_1_kernel:<
.read_1_disablecopyonread_teacher_conv2d_1_bias:J
0read_2_disablecopyonread_teacher_conv2d_2_kernel:<
.read_3_disablecopyonread_teacher_conv2d_2_bias:A
.read_4_disablecopyonread_teacher_latent_kernel:	�P:
,read_5_disablecopyonread_teacher_latent_bias:P@
-read_6_disablecopyonread_teacher_dense_kernel:	P�:
+read_7_disablecopyonread_teacher_dense_bias:	�J
0read_8_disablecopyonread_teacher_conv2d_3_kernel:<
.read_9_disablecopyonread_teacher_conv2d_3_bias:Q
7read_10_disablecopyonread_teacher_conv_transpose_kernel:C
5read_11_disablecopyonread_teacher_conv_transpose_bias:K
1read_12_disablecopyonread_teacher_conv2d_4_kernel:=
/read_13_disablecopyonread_teacher_conv2d_4_bias:J
0read_14_disablecopyonread_teacher_outputs_kernel:<
.read_15_disablecopyonread_teacher_outputs_bias:-
#read_16_disablecopyonread_iteration:	 1
'read_17_disablecopyonread_learning_rate: R
8read_18_disablecopyonread_adam_m_teacher_conv2d_1_kernel:R
8read_19_disablecopyonread_adam_v_teacher_conv2d_1_kernel:D
6read_20_disablecopyonread_adam_m_teacher_conv2d_1_bias:D
6read_21_disablecopyonread_adam_v_teacher_conv2d_1_bias:R
8read_22_disablecopyonread_adam_m_teacher_conv2d_2_kernel:R
8read_23_disablecopyonread_adam_v_teacher_conv2d_2_kernel:D
6read_24_disablecopyonread_adam_m_teacher_conv2d_2_bias:D
6read_25_disablecopyonread_adam_v_teacher_conv2d_2_bias:I
6read_26_disablecopyonread_adam_m_teacher_latent_kernel:	�PI
6read_27_disablecopyonread_adam_v_teacher_latent_kernel:	�PB
4read_28_disablecopyonread_adam_m_teacher_latent_bias:PB
4read_29_disablecopyonread_adam_v_teacher_latent_bias:PH
5read_30_disablecopyonread_adam_m_teacher_dense_kernel:	P�H
5read_31_disablecopyonread_adam_v_teacher_dense_kernel:	P�B
3read_32_disablecopyonread_adam_m_teacher_dense_bias:	�B
3read_33_disablecopyonread_adam_v_teacher_dense_bias:	�R
8read_34_disablecopyonread_adam_m_teacher_conv2d_3_kernel:R
8read_35_disablecopyonread_adam_v_teacher_conv2d_3_kernel:D
6read_36_disablecopyonread_adam_m_teacher_conv2d_3_bias:D
6read_37_disablecopyonread_adam_v_teacher_conv2d_3_bias:X
>read_38_disablecopyonread_adam_m_teacher_conv_transpose_kernel:X
>read_39_disablecopyonread_adam_v_teacher_conv_transpose_kernel:J
<read_40_disablecopyonread_adam_m_teacher_conv_transpose_bias:J
<read_41_disablecopyonread_adam_v_teacher_conv_transpose_bias:R
8read_42_disablecopyonread_adam_m_teacher_conv2d_4_kernel:R
8read_43_disablecopyonread_adam_v_teacher_conv2d_4_kernel:D
6read_44_disablecopyonread_adam_m_teacher_conv2d_4_bias:D
6read_45_disablecopyonread_adam_v_teacher_conv2d_4_bias:Q
7read_46_disablecopyonread_adam_m_teacher_outputs_kernel:Q
7read_47_disablecopyonread_adam_v_teacher_outputs_kernel:C
5read_48_disablecopyonread_adam_m_teacher_outputs_bias:C
5read_49_disablecopyonread_adam_v_teacher_outputs_bias:)
read_50_disablecopyonread_total: )
read_51_disablecopyonread_count: 
savev2_const
identity_105��MergeV2Checkpoints�Read/DisableCopyOnRead�Read/ReadVariableOp�Read_1/DisableCopyOnRead�Read_1/ReadVariableOp�Read_10/DisableCopyOnRead�Read_10/ReadVariableOp�Read_11/DisableCopyOnRead�Read_11/ReadVariableOp�Read_12/DisableCopyOnRead�Read_12/ReadVariableOp�Read_13/DisableCopyOnRead�Read_13/ReadVariableOp�Read_14/DisableCopyOnRead�Read_14/ReadVariableOp�Read_15/DisableCopyOnRead�Read_15/ReadVariableOp�Read_16/DisableCopyOnRead�Read_16/ReadVariableOp�Read_17/DisableCopyOnRead�Read_17/ReadVariableOp�Read_18/DisableCopyOnRead�Read_18/ReadVariableOp�Read_19/DisableCopyOnRead�Read_19/ReadVariableOp�Read_2/DisableCopyOnRead�Read_2/ReadVariableOp�Read_20/DisableCopyOnRead�Read_20/ReadVariableOp�Read_21/DisableCopyOnRead�Read_21/ReadVariableOp�Read_22/DisableCopyOnRead�Read_22/ReadVariableOp�Read_23/DisableCopyOnRead�Read_23/ReadVariableOp�Read_24/DisableCopyOnRead�Read_24/ReadVariableOp�Read_25/DisableCopyOnRead�Read_25/ReadVariableOp�Read_26/DisableCopyOnRead�Read_26/ReadVariableOp�Read_27/DisableCopyOnRead�Read_27/ReadVariableOp�Read_28/DisableCopyOnRead�Read_28/ReadVariableOp�Read_29/DisableCopyOnRead�Read_29/ReadVariableOp�Read_3/DisableCopyOnRead�Read_3/ReadVariableOp�Read_30/DisableCopyOnRead�Read_30/ReadVariableOp�Read_31/DisableCopyOnRead�Read_31/ReadVariableOp�Read_32/DisableCopyOnRead�Read_32/ReadVariableOp�Read_33/DisableCopyOnRead�Read_33/ReadVariableOp�Read_34/DisableCopyOnRead�Read_34/ReadVariableOp�Read_35/DisableCopyOnRead�Read_35/ReadVariableOp�Read_36/DisableCopyOnRead�Read_36/ReadVariableOp�Read_37/DisableCopyOnRead�Read_37/ReadVariableOp�Read_38/DisableCopyOnRead�Read_38/ReadVariableOp�Read_39/DisableCopyOnRead�Read_39/ReadVariableOp�Read_4/DisableCopyOnRead�Read_4/ReadVariableOp�Read_40/DisableCopyOnRead�Read_40/ReadVariableOp�Read_41/DisableCopyOnRead�Read_41/ReadVariableOp�Read_42/DisableCopyOnRead�Read_42/ReadVariableOp�Read_43/DisableCopyOnRead�Read_43/ReadVariableOp�Read_44/DisableCopyOnRead�Read_44/ReadVariableOp�Read_45/DisableCopyOnRead�Read_45/ReadVariableOp�Read_46/DisableCopyOnRead�Read_46/ReadVariableOp�Read_47/DisableCopyOnRead�Read_47/ReadVariableOp�Read_48/DisableCopyOnRead�Read_48/ReadVariableOp�Read_49/DisableCopyOnRead�Read_49/ReadVariableOp�Read_5/DisableCopyOnRead�Read_5/ReadVariableOp�Read_50/DisableCopyOnRead�Read_50/ReadVariableOp�Read_51/DisableCopyOnRead�Read_51/ReadVariableOp�Read_6/DisableCopyOnRead�Read_6/ReadVariableOp�Read_7/DisableCopyOnRead�Read_7/ReadVariableOp�Read_8/DisableCopyOnRead�Read_8/ReadVariableOp�Read_9/DisableCopyOnRead�Read_9/ReadVariableOpw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
Read/DisableCopyOnReadDisableCopyOnRead.read_disablecopyonread_teacher_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 �
Read/ReadVariableOpReadVariableOp.read_disablecopyonread_teacher_conv2d_1_kernel^Read/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0q
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:i

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_1/DisableCopyOnReadDisableCopyOnRead.read_1_disablecopyonread_teacher_conv2d_1_bias"/device:CPU:0*
_output_shapes
 �
Read_1/ReadVariableOpReadVariableOp.read_1_disablecopyonread_teacher_conv2d_1_bias^Read_1/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0i

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:_

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_2/DisableCopyOnReadDisableCopyOnRead0read_2_disablecopyonread_teacher_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_2/ReadVariableOpReadVariableOp0read_2_disablecopyonread_teacher_conv2d_2_kernel^Read_2/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0u

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:k

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_3/DisableCopyOnReadDisableCopyOnRead.read_3_disablecopyonread_teacher_conv2d_2_bias"/device:CPU:0*
_output_shapes
 �
Read_3/ReadVariableOpReadVariableOp.read_3_disablecopyonread_teacher_conv2d_2_bias^Read_3/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0i

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_4/DisableCopyOnReadDisableCopyOnRead.read_4_disablecopyonread_teacher_latent_kernel"/device:CPU:0*
_output_shapes
 �
Read_4/ReadVariableOpReadVariableOp.read_4_disablecopyonread_teacher_latent_kernel^Read_4/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�P*
dtype0n

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�Pd

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*
_output_shapes
:	�P�
Read_5/DisableCopyOnReadDisableCopyOnRead,read_5_disablecopyonread_teacher_latent_bias"/device:CPU:0*
_output_shapes
 �
Read_5/ReadVariableOpReadVariableOp,read_5_disablecopyonread_teacher_latent_bias^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:P*
dtype0j
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:Pa
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0*
_output_shapes
:P�
Read_6/DisableCopyOnReadDisableCopyOnRead-read_6_disablecopyonread_teacher_dense_kernel"/device:CPU:0*
_output_shapes
 �
Read_6/ReadVariableOpReadVariableOp-read_6_disablecopyonread_teacher_dense_kernel^Read_6/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	P�*
dtype0o
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	P�f
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
:	P�
Read_7/DisableCopyOnReadDisableCopyOnRead+read_7_disablecopyonread_teacher_dense_bias"/device:CPU:0*
_output_shapes
 �
Read_7/ReadVariableOpReadVariableOp+read_7_disablecopyonread_teacher_dense_bias^Read_7/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0k
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�b
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_8/DisableCopyOnReadDisableCopyOnRead0read_8_disablecopyonread_teacher_conv2d_3_kernel"/device:CPU:0*
_output_shapes
 �
Read_8/ReadVariableOpReadVariableOp0read_8_disablecopyonread_teacher_conv2d_3_kernel^Read_8/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0v
Identity_16IdentityRead_8/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_9/DisableCopyOnReadDisableCopyOnRead.read_9_disablecopyonread_teacher_conv2d_3_bias"/device:CPU:0*
_output_shapes
 �
Read_9/ReadVariableOpReadVariableOp.read_9_disablecopyonread_teacher_conv2d_3_bias^Read_9/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0j
Identity_18IdentityRead_9/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_10/DisableCopyOnReadDisableCopyOnRead7read_10_disablecopyonread_teacher_conv_transpose_kernel"/device:CPU:0*
_output_shapes
 �
Read_10/ReadVariableOpReadVariableOp7read_10_disablecopyonread_teacher_conv_transpose_kernel^Read_10/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_20IdentityRead_10/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_11/DisableCopyOnReadDisableCopyOnRead5read_11_disablecopyonread_teacher_conv_transpose_bias"/device:CPU:0*
_output_shapes
 �
Read_11/ReadVariableOpReadVariableOp5read_11_disablecopyonread_teacher_conv_transpose_bias^Read_11/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_22IdentityRead_11/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_12/DisableCopyOnReadDisableCopyOnRead1read_12_disablecopyonread_teacher_conv2d_4_kernel"/device:CPU:0*
_output_shapes
 �
Read_12/ReadVariableOpReadVariableOp1read_12_disablecopyonread_teacher_conv2d_4_kernel^Read_12/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_24IdentityRead_12/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_13/DisableCopyOnReadDisableCopyOnRead/read_13_disablecopyonread_teacher_conv2d_4_bias"/device:CPU:0*
_output_shapes
 �
Read_13/ReadVariableOpReadVariableOp/read_13_disablecopyonread_teacher_conv2d_4_bias^Read_13/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_26IdentityRead_13/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_14/DisableCopyOnReadDisableCopyOnRead0read_14_disablecopyonread_teacher_outputs_kernel"/device:CPU:0*
_output_shapes
 �
Read_14/ReadVariableOpReadVariableOp0read_14_disablecopyonread_teacher_outputs_kernel^Read_14/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_28IdentityRead_14/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_15/DisableCopyOnReadDisableCopyOnRead.read_15_disablecopyonread_teacher_outputs_bias"/device:CPU:0*
_output_shapes
 �
Read_15/ReadVariableOpReadVariableOp.read_15_disablecopyonread_teacher_outputs_bias^Read_15/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_30IdentityRead_15/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*
_output_shapes
:x
Read_16/DisableCopyOnReadDisableCopyOnRead#read_16_disablecopyonread_iteration"/device:CPU:0*
_output_shapes
 �
Read_16/ReadVariableOpReadVariableOp#read_16_disablecopyonread_iteration^Read_16/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	g
Identity_32IdentityRead_16/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: ]
Identity_33IdentityIdentity_32:output:0"/device:CPU:0*
T0	*
_output_shapes
: |
Read_17/DisableCopyOnReadDisableCopyOnRead'read_17_disablecopyonread_learning_rate"/device:CPU:0*
_output_shapes
 �
Read_17/ReadVariableOpReadVariableOp'read_17_disablecopyonread_learning_rate^Read_17/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_34IdentityRead_17/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_35IdentityIdentity_34:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_18/DisableCopyOnReadDisableCopyOnRead8read_18_disablecopyonread_adam_m_teacher_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_18/ReadVariableOpReadVariableOp8read_18_disablecopyonread_adam_m_teacher_conv2d_1_kernel^Read_18/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_36IdentityRead_18/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_37IdentityIdentity_36:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_19/DisableCopyOnReadDisableCopyOnRead8read_19_disablecopyonread_adam_v_teacher_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_19/ReadVariableOpReadVariableOp8read_19_disablecopyonread_adam_v_teacher_conv2d_1_kernel^Read_19/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_38IdentityRead_19/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_39IdentityIdentity_38:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_20/DisableCopyOnReadDisableCopyOnRead6read_20_disablecopyonread_adam_m_teacher_conv2d_1_bias"/device:CPU:0*
_output_shapes
 �
Read_20/ReadVariableOpReadVariableOp6read_20_disablecopyonread_adam_m_teacher_conv2d_1_bias^Read_20/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_40IdentityRead_20/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_41IdentityIdentity_40:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_21/DisableCopyOnReadDisableCopyOnRead6read_21_disablecopyonread_adam_v_teacher_conv2d_1_bias"/device:CPU:0*
_output_shapes
 �
Read_21/ReadVariableOpReadVariableOp6read_21_disablecopyonread_adam_v_teacher_conv2d_1_bias^Read_21/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_42IdentityRead_21/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_43IdentityIdentity_42:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_22/DisableCopyOnReadDisableCopyOnRead8read_22_disablecopyonread_adam_m_teacher_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_22/ReadVariableOpReadVariableOp8read_22_disablecopyonread_adam_m_teacher_conv2d_2_kernel^Read_22/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_44IdentityRead_22/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_45IdentityIdentity_44:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_23/DisableCopyOnReadDisableCopyOnRead8read_23_disablecopyonread_adam_v_teacher_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_23/ReadVariableOpReadVariableOp8read_23_disablecopyonread_adam_v_teacher_conv2d_2_kernel^Read_23/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_46IdentityRead_23/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_47IdentityIdentity_46:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_24/DisableCopyOnReadDisableCopyOnRead6read_24_disablecopyonread_adam_m_teacher_conv2d_2_bias"/device:CPU:0*
_output_shapes
 �
Read_24/ReadVariableOpReadVariableOp6read_24_disablecopyonread_adam_m_teacher_conv2d_2_bias^Read_24/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_48IdentityRead_24/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_49IdentityIdentity_48:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_25/DisableCopyOnReadDisableCopyOnRead6read_25_disablecopyonread_adam_v_teacher_conv2d_2_bias"/device:CPU:0*
_output_shapes
 �
Read_25/ReadVariableOpReadVariableOp6read_25_disablecopyonread_adam_v_teacher_conv2d_2_bias^Read_25/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_50IdentityRead_25/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_51IdentityIdentity_50:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_26/DisableCopyOnReadDisableCopyOnRead6read_26_disablecopyonread_adam_m_teacher_latent_kernel"/device:CPU:0*
_output_shapes
 �
Read_26/ReadVariableOpReadVariableOp6read_26_disablecopyonread_adam_m_teacher_latent_kernel^Read_26/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�P*
dtype0p
Identity_52IdentityRead_26/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�Pf
Identity_53IdentityIdentity_52:output:0"/device:CPU:0*
T0*
_output_shapes
:	�P�
Read_27/DisableCopyOnReadDisableCopyOnRead6read_27_disablecopyonread_adam_v_teacher_latent_kernel"/device:CPU:0*
_output_shapes
 �
Read_27/ReadVariableOpReadVariableOp6read_27_disablecopyonread_adam_v_teacher_latent_kernel^Read_27/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�P*
dtype0p
Identity_54IdentityRead_27/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�Pf
Identity_55IdentityIdentity_54:output:0"/device:CPU:0*
T0*
_output_shapes
:	�P�
Read_28/DisableCopyOnReadDisableCopyOnRead4read_28_disablecopyonread_adam_m_teacher_latent_bias"/device:CPU:0*
_output_shapes
 �
Read_28/ReadVariableOpReadVariableOp4read_28_disablecopyonread_adam_m_teacher_latent_bias^Read_28/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:P*
dtype0k
Identity_56IdentityRead_28/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:Pa
Identity_57IdentityIdentity_56:output:0"/device:CPU:0*
T0*
_output_shapes
:P�
Read_29/DisableCopyOnReadDisableCopyOnRead4read_29_disablecopyonread_adam_v_teacher_latent_bias"/device:CPU:0*
_output_shapes
 �
Read_29/ReadVariableOpReadVariableOp4read_29_disablecopyonread_adam_v_teacher_latent_bias^Read_29/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:P*
dtype0k
Identity_58IdentityRead_29/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:Pa
Identity_59IdentityIdentity_58:output:0"/device:CPU:0*
T0*
_output_shapes
:P�
Read_30/DisableCopyOnReadDisableCopyOnRead5read_30_disablecopyonread_adam_m_teacher_dense_kernel"/device:CPU:0*
_output_shapes
 �
Read_30/ReadVariableOpReadVariableOp5read_30_disablecopyonread_adam_m_teacher_dense_kernel^Read_30/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	P�*
dtype0p
Identity_60IdentityRead_30/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	P�f
Identity_61IdentityIdentity_60:output:0"/device:CPU:0*
T0*
_output_shapes
:	P��
Read_31/DisableCopyOnReadDisableCopyOnRead5read_31_disablecopyonread_adam_v_teacher_dense_kernel"/device:CPU:0*
_output_shapes
 �
Read_31/ReadVariableOpReadVariableOp5read_31_disablecopyonread_adam_v_teacher_dense_kernel^Read_31/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	P�*
dtype0p
Identity_62IdentityRead_31/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	P�f
Identity_63IdentityIdentity_62:output:0"/device:CPU:0*
T0*
_output_shapes
:	P��
Read_32/DisableCopyOnReadDisableCopyOnRead3read_32_disablecopyonread_adam_m_teacher_dense_bias"/device:CPU:0*
_output_shapes
 �
Read_32/ReadVariableOpReadVariableOp3read_32_disablecopyonread_adam_m_teacher_dense_bias^Read_32/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0l
Identity_64IdentityRead_32/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�b
Identity_65IdentityIdentity_64:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_33/DisableCopyOnReadDisableCopyOnRead3read_33_disablecopyonread_adam_v_teacher_dense_bias"/device:CPU:0*
_output_shapes
 �
Read_33/ReadVariableOpReadVariableOp3read_33_disablecopyonread_adam_v_teacher_dense_bias^Read_33/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0l
Identity_66IdentityRead_33/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�b
Identity_67IdentityIdentity_66:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_34/DisableCopyOnReadDisableCopyOnRead8read_34_disablecopyonread_adam_m_teacher_conv2d_3_kernel"/device:CPU:0*
_output_shapes
 �
Read_34/ReadVariableOpReadVariableOp8read_34_disablecopyonread_adam_m_teacher_conv2d_3_kernel^Read_34/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_68IdentityRead_34/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_69IdentityIdentity_68:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_35/DisableCopyOnReadDisableCopyOnRead8read_35_disablecopyonread_adam_v_teacher_conv2d_3_kernel"/device:CPU:0*
_output_shapes
 �
Read_35/ReadVariableOpReadVariableOp8read_35_disablecopyonread_adam_v_teacher_conv2d_3_kernel^Read_35/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_70IdentityRead_35/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_71IdentityIdentity_70:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_36/DisableCopyOnReadDisableCopyOnRead6read_36_disablecopyonread_adam_m_teacher_conv2d_3_bias"/device:CPU:0*
_output_shapes
 �
Read_36/ReadVariableOpReadVariableOp6read_36_disablecopyonread_adam_m_teacher_conv2d_3_bias^Read_36/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_72IdentityRead_36/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_73IdentityIdentity_72:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_37/DisableCopyOnReadDisableCopyOnRead6read_37_disablecopyonread_adam_v_teacher_conv2d_3_bias"/device:CPU:0*
_output_shapes
 �
Read_37/ReadVariableOpReadVariableOp6read_37_disablecopyonread_adam_v_teacher_conv2d_3_bias^Read_37/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_74IdentityRead_37/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_75IdentityIdentity_74:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_38/DisableCopyOnReadDisableCopyOnRead>read_38_disablecopyonread_adam_m_teacher_conv_transpose_kernel"/device:CPU:0*
_output_shapes
 �
Read_38/ReadVariableOpReadVariableOp>read_38_disablecopyonread_adam_m_teacher_conv_transpose_kernel^Read_38/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_76IdentityRead_38/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_77IdentityIdentity_76:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_39/DisableCopyOnReadDisableCopyOnRead>read_39_disablecopyonread_adam_v_teacher_conv_transpose_kernel"/device:CPU:0*
_output_shapes
 �
Read_39/ReadVariableOpReadVariableOp>read_39_disablecopyonread_adam_v_teacher_conv_transpose_kernel^Read_39/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_78IdentityRead_39/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_79IdentityIdentity_78:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_40/DisableCopyOnReadDisableCopyOnRead<read_40_disablecopyonread_adam_m_teacher_conv_transpose_bias"/device:CPU:0*
_output_shapes
 �
Read_40/ReadVariableOpReadVariableOp<read_40_disablecopyonread_adam_m_teacher_conv_transpose_bias^Read_40/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_80IdentityRead_40/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_81IdentityIdentity_80:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_41/DisableCopyOnReadDisableCopyOnRead<read_41_disablecopyonread_adam_v_teacher_conv_transpose_bias"/device:CPU:0*
_output_shapes
 �
Read_41/ReadVariableOpReadVariableOp<read_41_disablecopyonread_adam_v_teacher_conv_transpose_bias^Read_41/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_82IdentityRead_41/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_83IdentityIdentity_82:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_42/DisableCopyOnReadDisableCopyOnRead8read_42_disablecopyonread_adam_m_teacher_conv2d_4_kernel"/device:CPU:0*
_output_shapes
 �
Read_42/ReadVariableOpReadVariableOp8read_42_disablecopyonread_adam_m_teacher_conv2d_4_kernel^Read_42/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_84IdentityRead_42/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_85IdentityIdentity_84:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_43/DisableCopyOnReadDisableCopyOnRead8read_43_disablecopyonread_adam_v_teacher_conv2d_4_kernel"/device:CPU:0*
_output_shapes
 �
Read_43/ReadVariableOpReadVariableOp8read_43_disablecopyonread_adam_v_teacher_conv2d_4_kernel^Read_43/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_86IdentityRead_43/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_87IdentityIdentity_86:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_44/DisableCopyOnReadDisableCopyOnRead6read_44_disablecopyonread_adam_m_teacher_conv2d_4_bias"/device:CPU:0*
_output_shapes
 �
Read_44/ReadVariableOpReadVariableOp6read_44_disablecopyonread_adam_m_teacher_conv2d_4_bias^Read_44/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_88IdentityRead_44/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_89IdentityIdentity_88:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_45/DisableCopyOnReadDisableCopyOnRead6read_45_disablecopyonread_adam_v_teacher_conv2d_4_bias"/device:CPU:0*
_output_shapes
 �
Read_45/ReadVariableOpReadVariableOp6read_45_disablecopyonread_adam_v_teacher_conv2d_4_bias^Read_45/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_90IdentityRead_45/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_91IdentityIdentity_90:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_46/DisableCopyOnReadDisableCopyOnRead7read_46_disablecopyonread_adam_m_teacher_outputs_kernel"/device:CPU:0*
_output_shapes
 �
Read_46/ReadVariableOpReadVariableOp7read_46_disablecopyonread_adam_m_teacher_outputs_kernel^Read_46/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_92IdentityRead_46/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_93IdentityIdentity_92:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_47/DisableCopyOnReadDisableCopyOnRead7read_47_disablecopyonread_adam_v_teacher_outputs_kernel"/device:CPU:0*
_output_shapes
 �
Read_47/ReadVariableOpReadVariableOp7read_47_disablecopyonread_adam_v_teacher_outputs_kernel^Read_47/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_94IdentityRead_47/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_95IdentityIdentity_94:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_48/DisableCopyOnReadDisableCopyOnRead5read_48_disablecopyonread_adam_m_teacher_outputs_bias"/device:CPU:0*
_output_shapes
 �
Read_48/ReadVariableOpReadVariableOp5read_48_disablecopyonread_adam_m_teacher_outputs_bias^Read_48/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_96IdentityRead_48/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_97IdentityIdentity_96:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_49/DisableCopyOnReadDisableCopyOnRead5read_49_disablecopyonread_adam_v_teacher_outputs_bias"/device:CPU:0*
_output_shapes
 �
Read_49/ReadVariableOpReadVariableOp5read_49_disablecopyonread_adam_v_teacher_outputs_bias^Read_49/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_98IdentityRead_49/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_99IdentityIdentity_98:output:0"/device:CPU:0*
T0*
_output_shapes
:t
Read_50/DisableCopyOnReadDisableCopyOnReadread_50_disablecopyonread_total"/device:CPU:0*
_output_shapes
 �
Read_50/ReadVariableOpReadVariableOpread_50_disablecopyonread_total^Read_50/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_100IdentityRead_50/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_101IdentityIdentity_100:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_51/DisableCopyOnReadDisableCopyOnReadread_51_disablecopyonread_count"/device:CPU:0*
_output_shapes
 �
Read_51/ReadVariableOpReadVariableOpread_51_disablecopyonread_count^Read_51/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_102IdentityRead_51/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_103IdentityIdentity_102:output:0"/device:CPU:0*
T0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:5*
dtype0*�
value�B�5B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:5*
dtype0*}
valuetBr5B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0Identity_49:output:0Identity_51:output:0Identity_53:output:0Identity_55:output:0Identity_57:output:0Identity_59:output:0Identity_61:output:0Identity_63:output:0Identity_65:output:0Identity_67:output:0Identity_69:output:0Identity_71:output:0Identity_73:output:0Identity_75:output:0Identity_77:output:0Identity_79:output:0Identity_81:output:0Identity_83:output:0Identity_85:output:0Identity_87:output:0Identity_89:output:0Identity_91:output:0Identity_93:output:0Identity_95:output:0Identity_97:output:0Identity_99:output:0Identity_101:output:0Identity_103:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *C
dtypes9
725	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 j
Identity_104Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: W
Identity_105IdentityIdentity_104:output:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_16/DisableCopyOnRead^Read_16/ReadVariableOp^Read_17/DisableCopyOnRead^Read_17/ReadVariableOp^Read_18/DisableCopyOnRead^Read_18/ReadVariableOp^Read_19/DisableCopyOnRead^Read_19/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_20/DisableCopyOnRead^Read_20/ReadVariableOp^Read_21/DisableCopyOnRead^Read_21/ReadVariableOp^Read_22/DisableCopyOnRead^Read_22/ReadVariableOp^Read_23/DisableCopyOnRead^Read_23/ReadVariableOp^Read_24/DisableCopyOnRead^Read_24/ReadVariableOp^Read_25/DisableCopyOnRead^Read_25/ReadVariableOp^Read_26/DisableCopyOnRead^Read_26/ReadVariableOp^Read_27/DisableCopyOnRead^Read_27/ReadVariableOp^Read_28/DisableCopyOnRead^Read_28/ReadVariableOp^Read_29/DisableCopyOnRead^Read_29/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_30/DisableCopyOnRead^Read_30/ReadVariableOp^Read_31/DisableCopyOnRead^Read_31/ReadVariableOp^Read_32/DisableCopyOnRead^Read_32/ReadVariableOp^Read_33/DisableCopyOnRead^Read_33/ReadVariableOp^Read_34/DisableCopyOnRead^Read_34/ReadVariableOp^Read_35/DisableCopyOnRead^Read_35/ReadVariableOp^Read_36/DisableCopyOnRead^Read_36/ReadVariableOp^Read_37/DisableCopyOnRead^Read_37/ReadVariableOp^Read_38/DisableCopyOnRead^Read_38/ReadVariableOp^Read_39/DisableCopyOnRead^Read_39/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_40/DisableCopyOnRead^Read_40/ReadVariableOp^Read_41/DisableCopyOnRead^Read_41/ReadVariableOp^Read_42/DisableCopyOnRead^Read_42/ReadVariableOp^Read_43/DisableCopyOnRead^Read_43/ReadVariableOp^Read_44/DisableCopyOnRead^Read_44/ReadVariableOp^Read_45/DisableCopyOnRead^Read_45/ReadVariableOp^Read_46/DisableCopyOnRead^Read_46/ReadVariableOp^Read_47/DisableCopyOnRead^Read_47/ReadVariableOp^Read_48/DisableCopyOnRead^Read_48/ReadVariableOp^Read_49/DisableCopyOnRead^Read_49/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_50/DisableCopyOnRead^Read_50/ReadVariableOp^Read_51/DisableCopyOnRead^Read_51/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp*
_output_shapes
 "%
identity_105Identity_105:output:0*(
_construction_contextkEagerRuntime*
_input_shapesn
l: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp26
Read_10/DisableCopyOnReadRead_10/DisableCopyOnRead20
Read_10/ReadVariableOpRead_10/ReadVariableOp26
Read_11/DisableCopyOnReadRead_11/DisableCopyOnRead20
Read_11/ReadVariableOpRead_11/ReadVariableOp26
Read_12/DisableCopyOnReadRead_12/DisableCopyOnRead20
Read_12/ReadVariableOpRead_12/ReadVariableOp26
Read_13/DisableCopyOnReadRead_13/DisableCopyOnRead20
Read_13/ReadVariableOpRead_13/ReadVariableOp26
Read_14/DisableCopyOnReadRead_14/DisableCopyOnRead20
Read_14/ReadVariableOpRead_14/ReadVariableOp26
Read_15/DisableCopyOnReadRead_15/DisableCopyOnRead20
Read_15/ReadVariableOpRead_15/ReadVariableOp26
Read_16/DisableCopyOnReadRead_16/DisableCopyOnRead20
Read_16/ReadVariableOpRead_16/ReadVariableOp26
Read_17/DisableCopyOnReadRead_17/DisableCopyOnRead20
Read_17/ReadVariableOpRead_17/ReadVariableOp26
Read_18/DisableCopyOnReadRead_18/DisableCopyOnRead20
Read_18/ReadVariableOpRead_18/ReadVariableOp26
Read_19/DisableCopyOnReadRead_19/DisableCopyOnRead20
Read_19/ReadVariableOpRead_19/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp26
Read_20/DisableCopyOnReadRead_20/DisableCopyOnRead20
Read_20/ReadVariableOpRead_20/ReadVariableOp26
Read_21/DisableCopyOnReadRead_21/DisableCopyOnRead20
Read_21/ReadVariableOpRead_21/ReadVariableOp26
Read_22/DisableCopyOnReadRead_22/DisableCopyOnRead20
Read_22/ReadVariableOpRead_22/ReadVariableOp26
Read_23/DisableCopyOnReadRead_23/DisableCopyOnRead20
Read_23/ReadVariableOpRead_23/ReadVariableOp26
Read_24/DisableCopyOnReadRead_24/DisableCopyOnRead20
Read_24/ReadVariableOpRead_24/ReadVariableOp26
Read_25/DisableCopyOnReadRead_25/DisableCopyOnRead20
Read_25/ReadVariableOpRead_25/ReadVariableOp26
Read_26/DisableCopyOnReadRead_26/DisableCopyOnRead20
Read_26/ReadVariableOpRead_26/ReadVariableOp26
Read_27/DisableCopyOnReadRead_27/DisableCopyOnRead20
Read_27/ReadVariableOpRead_27/ReadVariableOp26
Read_28/DisableCopyOnReadRead_28/DisableCopyOnRead20
Read_28/ReadVariableOpRead_28/ReadVariableOp26
Read_29/DisableCopyOnReadRead_29/DisableCopyOnRead20
Read_29/ReadVariableOpRead_29/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp26
Read_30/DisableCopyOnReadRead_30/DisableCopyOnRead20
Read_30/ReadVariableOpRead_30/ReadVariableOp26
Read_31/DisableCopyOnReadRead_31/DisableCopyOnRead20
Read_31/ReadVariableOpRead_31/ReadVariableOp26
Read_32/DisableCopyOnReadRead_32/DisableCopyOnRead20
Read_32/ReadVariableOpRead_32/ReadVariableOp26
Read_33/DisableCopyOnReadRead_33/DisableCopyOnRead20
Read_33/ReadVariableOpRead_33/ReadVariableOp26
Read_34/DisableCopyOnReadRead_34/DisableCopyOnRead20
Read_34/ReadVariableOpRead_34/ReadVariableOp26
Read_35/DisableCopyOnReadRead_35/DisableCopyOnRead20
Read_35/ReadVariableOpRead_35/ReadVariableOp26
Read_36/DisableCopyOnReadRead_36/DisableCopyOnRead20
Read_36/ReadVariableOpRead_36/ReadVariableOp26
Read_37/DisableCopyOnReadRead_37/DisableCopyOnRead20
Read_37/ReadVariableOpRead_37/ReadVariableOp26
Read_38/DisableCopyOnReadRead_38/DisableCopyOnRead20
Read_38/ReadVariableOpRead_38/ReadVariableOp26
Read_39/DisableCopyOnReadRead_39/DisableCopyOnRead20
Read_39/ReadVariableOpRead_39/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp26
Read_40/DisableCopyOnReadRead_40/DisableCopyOnRead20
Read_40/ReadVariableOpRead_40/ReadVariableOp26
Read_41/DisableCopyOnReadRead_41/DisableCopyOnRead20
Read_41/ReadVariableOpRead_41/ReadVariableOp26
Read_42/DisableCopyOnReadRead_42/DisableCopyOnRead20
Read_42/ReadVariableOpRead_42/ReadVariableOp26
Read_43/DisableCopyOnReadRead_43/DisableCopyOnRead20
Read_43/ReadVariableOpRead_43/ReadVariableOp26
Read_44/DisableCopyOnReadRead_44/DisableCopyOnRead20
Read_44/ReadVariableOpRead_44/ReadVariableOp26
Read_45/DisableCopyOnReadRead_45/DisableCopyOnRead20
Read_45/ReadVariableOpRead_45/ReadVariableOp26
Read_46/DisableCopyOnReadRead_46/DisableCopyOnRead20
Read_46/ReadVariableOpRead_46/ReadVariableOp26
Read_47/DisableCopyOnReadRead_47/DisableCopyOnRead20
Read_47/ReadVariableOpRead_47/ReadVariableOp26
Read_48/DisableCopyOnReadRead_48/DisableCopyOnRead20
Read_48/ReadVariableOpRead_48/ReadVariableOp26
Read_49/DisableCopyOnReadRead_49/DisableCopyOnRead20
Read_49/ReadVariableOpRead_49/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp26
Read_50/DisableCopyOnReadRead_50/DisableCopyOnRead20
Read_50/ReadVariableOpRead_50/ReadVariableOp26
Read_51/DisableCopyOnReadRead_51/DisableCopyOnRead20
Read_51/ReadVariableOpRead_51/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp24
Read_8/DisableCopyOnReadRead_8/DisableCopyOnRead2.
Read_8/ReadVariableOpRead_8/ReadVariableOp24
Read_9/DisableCopyOnReadRead_9/DisableCopyOnRead2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:=59

_output_shapes
: 

_user_specified_nameConst:%4!

_user_specified_namecount:%3!

_user_specified_nametotal:;27
5
_user_specified_nameAdam/v/teacher_outputs/bias:;17
5
_user_specified_nameAdam/m/teacher_outputs/bias:=09
7
_user_specified_nameAdam/v/teacher_outputs/kernel:=/9
7
_user_specified_nameAdam/m/teacher_outputs/kernel:<.8
6
_user_specified_nameAdam/v/teacher_conv2d_4/bias:<-8
6
_user_specified_nameAdam/m/teacher_conv2d_4/bias:>,:
8
_user_specified_name Adam/v/teacher_conv2d_4/kernel:>+:
8
_user_specified_name Adam/m/teacher_conv2d_4/kernel:B*>
<
_user_specified_name$"Adam/v/teacher_conv_transpose/bias:B)>
<
_user_specified_name$"Adam/m/teacher_conv_transpose/bias:D(@
>
_user_specified_name&$Adam/v/teacher_conv_transpose/kernel:D'@
>
_user_specified_name&$Adam/m/teacher_conv_transpose/kernel:<&8
6
_user_specified_nameAdam/v/teacher_conv2d_3/bias:<%8
6
_user_specified_nameAdam/m/teacher_conv2d_3/bias:>$:
8
_user_specified_name Adam/v/teacher_conv2d_3/kernel:>#:
8
_user_specified_name Adam/m/teacher_conv2d_3/kernel:9"5
3
_user_specified_nameAdam/v/teacher_dense/bias:9!5
3
_user_specified_nameAdam/m/teacher_dense/bias:; 7
5
_user_specified_nameAdam/v/teacher_dense/kernel:;7
5
_user_specified_nameAdam/m/teacher_dense/kernel::6
4
_user_specified_nameAdam/v/teacher_latent/bias::6
4
_user_specified_nameAdam/m/teacher_latent/bias:<8
6
_user_specified_nameAdam/v/teacher_latent/kernel:<8
6
_user_specified_nameAdam/m/teacher_latent/kernel:<8
6
_user_specified_nameAdam/v/teacher_conv2d_2/bias:<8
6
_user_specified_nameAdam/m/teacher_conv2d_2/bias:>:
8
_user_specified_name Adam/v/teacher_conv2d_2/kernel:>:
8
_user_specified_name Adam/m/teacher_conv2d_2/kernel:<8
6
_user_specified_nameAdam/v/teacher_conv2d_1/bias:<8
6
_user_specified_nameAdam/m/teacher_conv2d_1/bias:>:
8
_user_specified_name Adam/v/teacher_conv2d_1/kernel:>:
8
_user_specified_name Adam/m/teacher_conv2d_1/kernel:-)
'
_user_specified_namelearning_rate:)%
#
_user_specified_name	iteration:40
.
_user_specified_nameteacher_outputs/bias:62
0
_user_specified_nameteacher_outputs/kernel:51
/
_user_specified_nameteacher_conv2d_4/bias:73
1
_user_specified_nameteacher_conv2d_4/kernel:;7
5
_user_specified_nameteacher_conv_transpose/bias:=9
7
_user_specified_nameteacher_conv_transpose/kernel:5
1
/
_user_specified_nameteacher_conv2d_3/bias:7	3
1
_user_specified_nameteacher_conv2d_3/kernel:2.
,
_user_specified_nameteacher_dense/bias:40
.
_user_specified_nameteacher_dense/kernel:3/
-
_user_specified_nameteacher_latent/bias:51
/
_user_specified_nameteacher_latent/kernel:51
/
_user_specified_nameteacher_conv2d_2/bias:73
1
_user_specified_nameteacher_conv2d_2/kernel:51
/
_user_specified_nameteacher_conv2d_1/bias:73
1
_user_specified_nameteacher_conv2d_1/kernel:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
K
#__inference__update_step_xla_842964
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:($
"
_user_specified_name
variable:D @

_output_shapes
:
"
_user_specified_name
gradient
�

�
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062376

inputs1
matmul_readvariableop_resource:	P�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:����������S
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������P: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:O K
'
_output_shapes
:���������P
 
_user_specified_nameinputs
�
�
4__inference_teacher_conv2d_4_layer_call_fn_100062983

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062438w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062979:)%
#
_user_specified_name	100062977:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
$__inference__wrapped_model_100062231
teacher_inputs_[
Ateacher_transpose_teacher_conv2d_1_conv2d_readvariableop_resource:P
Bteacher_transpose_teacher_conv2d_1_biasadd_readvariableop_resource:[
Ateacher_transpose_teacher_conv2d_2_conv2d_readvariableop_resource:P
Bteacher_transpose_teacher_conv2d_2_biasadd_readvariableop_resource:R
?teacher_transpose_teacher_latent_matmul_readvariableop_resource:	�PN
@teacher_transpose_teacher_latent_biasadd_readvariableop_resource:PQ
>teacher_transpose_teacher_dense_matmul_readvariableop_resource:	P�N
?teacher_transpose_teacher_dense_biasadd_readvariableop_resource:	�[
Ateacher_transpose_teacher_conv2d_3_conv2d_readvariableop_resource:P
Bteacher_transpose_teacher_conv2d_3_biasadd_readvariableop_resource:k
Qteacher_transpose_teacher_conv_transpose_conv2d_transpose_readvariableop_resource:V
Hteacher_transpose_teacher_conv_transpose_biasadd_readvariableop_resource:[
Ateacher_transpose_teacher_conv2d_4_conv2d_readvariableop_resource:P
Bteacher_transpose_teacher_conv2d_4_biasadd_readvariableop_resource:Z
@teacher_transpose_teacher_outputs_conv2d_readvariableop_resource:O
Ateacher_transpose_teacher_outputs_biasadd_readvariableop_resource:
identity��9teacher-transpose/teacher_conv2d_1/BiasAdd/ReadVariableOp�8teacher-transpose/teacher_conv2d_1/Conv2D/ReadVariableOp�9teacher-transpose/teacher_conv2d_2/BiasAdd/ReadVariableOp�8teacher-transpose/teacher_conv2d_2/Conv2D/ReadVariableOp�9teacher-transpose/teacher_conv2d_3/BiasAdd/ReadVariableOp�8teacher-transpose/teacher_conv2d_3/Conv2D/ReadVariableOp�9teacher-transpose/teacher_conv2d_4/BiasAdd/ReadVariableOp�8teacher-transpose/teacher_conv2d_4/Conv2D/ReadVariableOp�?teacher-transpose/teacher_conv_transpose/BiasAdd/ReadVariableOp�Hteacher-transpose/teacher_conv_transpose/conv2d_transpose/ReadVariableOp�6teacher-transpose/teacher_dense/BiasAdd/ReadVariableOp�5teacher-transpose/teacher_dense/MatMul/ReadVariableOp�7teacher-transpose/teacher_latent/BiasAdd/ReadVariableOp�6teacher-transpose/teacher_latent/MatMul/ReadVariableOp�8teacher-transpose/teacher_outputs/BiasAdd/ReadVariableOp�7teacher-transpose/teacher_outputs/Conv2D/ReadVariableOpt
'teacher-transpose/teacher_reshape/ShapeShapeteacher_inputs_*
T0*
_output_shapes
::��
5teacher-transpose/teacher_reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
7teacher-transpose/teacher_reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
7teacher-transpose/teacher_reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
/teacher-transpose/teacher_reshape/strided_sliceStridedSlice0teacher-transpose/teacher_reshape/Shape:output:0>teacher-transpose/teacher_reshape/strided_slice/stack:output:0@teacher-transpose/teacher_reshape/strided_slice/stack_1:output:0@teacher-transpose/teacher_reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_masks
1teacher-transpose/teacher_reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :s
1teacher-transpose/teacher_reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :s
1teacher-transpose/teacher_reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
/teacher-transpose/teacher_reshape/Reshape/shapePack8teacher-transpose/teacher_reshape/strided_slice:output:0:teacher-transpose/teacher_reshape/Reshape/shape/1:output:0:teacher-transpose/teacher_reshape/Reshape/shape/2:output:0:teacher-transpose/teacher_reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
)teacher-transpose/teacher_reshape/ReshapeReshapeteacher_inputs_8teacher-transpose/teacher_reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:����������
8teacher-transpose/teacher_conv2d_1/Conv2D/ReadVariableOpReadVariableOpAteacher_transpose_teacher_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
)teacher-transpose/teacher_conv2d_1/Conv2DConv2D2teacher-transpose/teacher_reshape/Reshape:output:0@teacher-transpose/teacher_conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
9teacher-transpose/teacher_conv2d_1/BiasAdd/ReadVariableOpReadVariableOpBteacher_transpose_teacher_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
*teacher-transpose/teacher_conv2d_1/BiasAddBiasAdd2teacher-transpose/teacher_conv2d_1/Conv2D:output:0Ateacher-transpose/teacher_conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:����������
%teacher-transpose/teacher_relu_1/ReluRelu3teacher-transpose/teacher_conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:����������
(teacher-transpose/teacher_pool_1/AvgPoolAvgPool3teacher-transpose/teacher_relu_1/Relu:activations:0*
T0*/
_output_shapes
:���������	*
ksize
*
paddingVALID*
strides
�
8teacher-transpose/teacher_conv2d_2/Conv2D/ReadVariableOpReadVariableOpAteacher_transpose_teacher_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
)teacher-transpose/teacher_conv2d_2/Conv2DConv2D1teacher-transpose/teacher_pool_1/AvgPool:output:0@teacher-transpose/teacher_conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
9teacher-transpose/teacher_conv2d_2/BiasAdd/ReadVariableOpReadVariableOpBteacher_transpose_teacher_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
*teacher-transpose/teacher_conv2d_2/BiasAddBiasAdd2teacher-transpose/teacher_conv2d_2/Conv2D:output:0Ateacher-transpose/teacher_conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
%teacher-transpose/teacher_relu_2/ReluRelu3teacher-transpose/teacher_conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	x
'teacher-transpose/teacher_flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  �
)teacher-transpose/teacher_flatten/ReshapeReshape3teacher-transpose/teacher_relu_2/Relu:activations:00teacher-transpose/teacher_flatten/Const:output:0*
T0*(
_output_shapes
:�����������
6teacher-transpose/teacher_latent/MatMul/ReadVariableOpReadVariableOp?teacher_transpose_teacher_latent_matmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0�
'teacher-transpose/teacher_latent/MatMulMatMul2teacher-transpose/teacher_flatten/Reshape:output:0>teacher-transpose/teacher_latent/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P�
7teacher-transpose/teacher_latent/BiasAdd/ReadVariableOpReadVariableOp@teacher_transpose_teacher_latent_biasadd_readvariableop_resource*
_output_shapes
:P*
dtype0�
(teacher-transpose/teacher_latent/BiasAddBiasAdd1teacher-transpose/teacher_latent/MatMul:product:0?teacher-transpose/teacher_latent/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P�
%teacher-transpose/teacher_latent/ReluRelu1teacher-transpose/teacher_latent/BiasAdd:output:0*
T0*'
_output_shapes
:���������P�
5teacher-transpose/teacher_dense/MatMul/ReadVariableOpReadVariableOp>teacher_transpose_teacher_dense_matmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0�
&teacher-transpose/teacher_dense/MatMulMatMul3teacher-transpose/teacher_latent/Relu:activations:0=teacher-transpose/teacher_dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
6teacher-transpose/teacher_dense/BiasAdd/ReadVariableOpReadVariableOp?teacher_transpose_teacher_dense_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
'teacher-transpose/teacher_dense/BiasAddBiasAdd0teacher-transpose/teacher_dense/MatMul:product:0>teacher-transpose/teacher_dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
(teacher-transpose/teacher_reshape2/ShapeShape0teacher-transpose/teacher_dense/BiasAdd:output:0*
T0*
_output_shapes
::���
6teacher-transpose/teacher_reshape2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
8teacher-transpose/teacher_reshape2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
8teacher-transpose/teacher_reshape2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
0teacher-transpose/teacher_reshape2/strided_sliceStridedSlice1teacher-transpose/teacher_reshape2/Shape:output:0?teacher-transpose/teacher_reshape2/strided_slice/stack:output:0Ateacher-transpose/teacher_reshape2/strided_slice/stack_1:output:0Ateacher-transpose/teacher_reshape2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskt
2teacher-transpose/teacher_reshape2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	t
2teacher-transpose/teacher_reshape2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :t
2teacher-transpose/teacher_reshape2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
0teacher-transpose/teacher_reshape2/Reshape/shapePack9teacher-transpose/teacher_reshape2/strided_slice:output:0;teacher-transpose/teacher_reshape2/Reshape/shape/1:output:0;teacher-transpose/teacher_reshape2/Reshape/shape/2:output:0;teacher-transpose/teacher_reshape2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
*teacher-transpose/teacher_reshape2/ReshapeReshape0teacher-transpose/teacher_dense/BiasAdd:output:09teacher-transpose/teacher_reshape2/Reshape/shape:output:0*
T0*/
_output_shapes
:���������	�
%teacher-transpose/teacher_relu_3/ReluRelu3teacher-transpose/teacher_reshape2/Reshape:output:0*
T0*/
_output_shapes
:���������	�
8teacher-transpose/teacher_conv2d_3/Conv2D/ReadVariableOpReadVariableOpAteacher_transpose_teacher_conv2d_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
)teacher-transpose/teacher_conv2d_3/Conv2DConv2D3teacher-transpose/teacher_relu_3/Relu:activations:0@teacher-transpose/teacher_conv2d_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
9teacher-transpose/teacher_conv2d_3/BiasAdd/ReadVariableOpReadVariableOpBteacher_transpose_teacher_conv2d_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
*teacher-transpose/teacher_conv2d_3/BiasAddBiasAdd2teacher-transpose/teacher_conv2d_3/Conv2D:output:0Ateacher-transpose/teacher_conv2d_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
%teacher-transpose/teacher_relu_4/ReluRelu3teacher-transpose/teacher_conv2d_3/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
.teacher-transpose/teacher_conv_transpose/ShapeShape3teacher-transpose/teacher_relu_4/Relu:activations:0*
T0*
_output_shapes
::���
<teacher-transpose/teacher_conv_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
>teacher-transpose/teacher_conv_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
>teacher-transpose/teacher_conv_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
6teacher-transpose/teacher_conv_transpose/strided_sliceStridedSlice7teacher-transpose/teacher_conv_transpose/Shape:output:0Eteacher-transpose/teacher_conv_transpose/strided_slice/stack:output:0Gteacher-transpose/teacher_conv_transpose/strided_slice/stack_1:output:0Gteacher-transpose/teacher_conv_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskr
0teacher-transpose/teacher_conv_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B :r
0teacher-transpose/teacher_conv_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B :r
0teacher-transpose/teacher_conv_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
.teacher-transpose/teacher_conv_transpose/stackPack?teacher-transpose/teacher_conv_transpose/strided_slice:output:09teacher-transpose/teacher_conv_transpose/stack/1:output:09teacher-transpose/teacher_conv_transpose/stack/2:output:09teacher-transpose/teacher_conv_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:�
>teacher-transpose/teacher_conv_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: �
@teacher-transpose/teacher_conv_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
@teacher-transpose/teacher_conv_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
8teacher-transpose/teacher_conv_transpose/strided_slice_1StridedSlice7teacher-transpose/teacher_conv_transpose/stack:output:0Gteacher-transpose/teacher_conv_transpose/strided_slice_1/stack:output:0Iteacher-transpose/teacher_conv_transpose/strided_slice_1/stack_1:output:0Iteacher-transpose/teacher_conv_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
Hteacher-transpose/teacher_conv_transpose/conv2d_transpose/ReadVariableOpReadVariableOpQteacher_transpose_teacher_conv_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
:*
dtype0�
9teacher-transpose/teacher_conv_transpose/conv2d_transposeConv2DBackpropInput7teacher-transpose/teacher_conv_transpose/stack:output:0Pteacher-transpose/teacher_conv_transpose/conv2d_transpose/ReadVariableOp:value:03teacher-transpose/teacher_relu_4/Relu:activations:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
?teacher-transpose/teacher_conv_transpose/BiasAdd/ReadVariableOpReadVariableOpHteacher_transpose_teacher_conv_transpose_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
0teacher-transpose/teacher_conv_transpose/BiasAddBiasAddBteacher-transpose/teacher_conv_transpose/conv2d_transpose:output:0Gteacher-transpose/teacher_conv_transpose/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:����������
8teacher-transpose/teacher_conv2d_4/Conv2D/ReadVariableOpReadVariableOpAteacher_transpose_teacher_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
)teacher-transpose/teacher_conv2d_4/Conv2DConv2D9teacher-transpose/teacher_conv_transpose/BiasAdd:output:0@teacher-transpose/teacher_conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
9teacher-transpose/teacher_conv2d_4/BiasAdd/ReadVariableOpReadVariableOpBteacher_transpose_teacher_conv2d_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
*teacher-transpose/teacher_conv2d_4/BiasAddBiasAdd2teacher-transpose/teacher_conv2d_4/Conv2D:output:0Ateacher-transpose/teacher_conv2d_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:����������
%teacher-transpose/teacher_relu_5/ReluRelu3teacher-transpose/teacher_conv2d_4/BiasAdd:output:0*
T0*/
_output_shapes
:����������
7teacher-transpose/teacher_outputs/Conv2D/ReadVariableOpReadVariableOp@teacher_transpose_teacher_outputs_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
(teacher-transpose/teacher_outputs/Conv2DConv2D3teacher-transpose/teacher_relu_5/Relu:activations:0?teacher-transpose/teacher_outputs/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
8teacher-transpose/teacher_outputs/BiasAdd/ReadVariableOpReadVariableOpAteacher_transpose_teacher_outputs_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
)teacher-transpose/teacher_outputs/BiasAddBiasAdd1teacher-transpose/teacher_outputs/Conv2D:output:0@teacher-transpose/teacher_outputs/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:����������
&teacher-transpose/teacher_outputs/ReluRelu2teacher-transpose/teacher_outputs/BiasAdd:output:0*
T0*/
_output_shapes
:����������
IdentityIdentity4teacher-transpose/teacher_outputs/Relu:activations:0^NoOp*
T0*/
_output_shapes
:����������
NoOpNoOp:^teacher-transpose/teacher_conv2d_1/BiasAdd/ReadVariableOp9^teacher-transpose/teacher_conv2d_1/Conv2D/ReadVariableOp:^teacher-transpose/teacher_conv2d_2/BiasAdd/ReadVariableOp9^teacher-transpose/teacher_conv2d_2/Conv2D/ReadVariableOp:^teacher-transpose/teacher_conv2d_3/BiasAdd/ReadVariableOp9^teacher-transpose/teacher_conv2d_3/Conv2D/ReadVariableOp:^teacher-transpose/teacher_conv2d_4/BiasAdd/ReadVariableOp9^teacher-transpose/teacher_conv2d_4/Conv2D/ReadVariableOp@^teacher-transpose/teacher_conv_transpose/BiasAdd/ReadVariableOpI^teacher-transpose/teacher_conv_transpose/conv2d_transpose/ReadVariableOp7^teacher-transpose/teacher_dense/BiasAdd/ReadVariableOp6^teacher-transpose/teacher_dense/MatMul/ReadVariableOp8^teacher-transpose/teacher_latent/BiasAdd/ReadVariableOp7^teacher-transpose/teacher_latent/MatMul/ReadVariableOp9^teacher-transpose/teacher_outputs/BiasAdd/ReadVariableOp8^teacher-transpose/teacher_outputs/Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������: : : : : : : : : : : : : : : : 2v
9teacher-transpose/teacher_conv2d_1/BiasAdd/ReadVariableOp9teacher-transpose/teacher_conv2d_1/BiasAdd/ReadVariableOp2t
8teacher-transpose/teacher_conv2d_1/Conv2D/ReadVariableOp8teacher-transpose/teacher_conv2d_1/Conv2D/ReadVariableOp2v
9teacher-transpose/teacher_conv2d_2/BiasAdd/ReadVariableOp9teacher-transpose/teacher_conv2d_2/BiasAdd/ReadVariableOp2t
8teacher-transpose/teacher_conv2d_2/Conv2D/ReadVariableOp8teacher-transpose/teacher_conv2d_2/Conv2D/ReadVariableOp2v
9teacher-transpose/teacher_conv2d_3/BiasAdd/ReadVariableOp9teacher-transpose/teacher_conv2d_3/BiasAdd/ReadVariableOp2t
8teacher-transpose/teacher_conv2d_3/Conv2D/ReadVariableOp8teacher-transpose/teacher_conv2d_3/Conv2D/ReadVariableOp2v
9teacher-transpose/teacher_conv2d_4/BiasAdd/ReadVariableOp9teacher-transpose/teacher_conv2d_4/BiasAdd/ReadVariableOp2t
8teacher-transpose/teacher_conv2d_4/Conv2D/ReadVariableOp8teacher-transpose/teacher_conv2d_4/Conv2D/ReadVariableOp2�
?teacher-transpose/teacher_conv_transpose/BiasAdd/ReadVariableOp?teacher-transpose/teacher_conv_transpose/BiasAdd/ReadVariableOp2�
Hteacher-transpose/teacher_conv_transpose/conv2d_transpose/ReadVariableOpHteacher-transpose/teacher_conv_transpose/conv2d_transpose/ReadVariableOp2p
6teacher-transpose/teacher_dense/BiasAdd/ReadVariableOp6teacher-transpose/teacher_dense/BiasAdd/ReadVariableOp2n
5teacher-transpose/teacher_dense/MatMul/ReadVariableOp5teacher-transpose/teacher_dense/MatMul/ReadVariableOp2r
7teacher-transpose/teacher_latent/BiasAdd/ReadVariableOp7teacher-transpose/teacher_latent/BiasAdd/ReadVariableOp2p
6teacher-transpose/teacher_latent/MatMul/ReadVariableOp6teacher-transpose/teacher_latent/MatMul/ReadVariableOp2t
8teacher-transpose/teacher_outputs/BiasAdd/ReadVariableOp8teacher-transpose/teacher_outputs/BiasAdd/ReadVariableOp2r
7teacher-transpose/teacher_outputs/Conv2D/ReadVariableOp7teacher-transpose/teacher_outputs/Conv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:(
$
"
_user_specified_name
resource:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
i
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100063003

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062922

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
O
3__inference_teacher_flatten_layer_call_fn_100062829

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *W
fRRP
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062349a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
W
#__inference__update_step_xla_842889
gradient"
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:: *
	_noinline(:($
"
_user_specified_name
variable:P L
&
_output_shapes
:
"
_user_specified_name
gradient
�
�
1__inference_teacher_dense_layer_call_fn_100062864

inputs
unknown:	P�
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *U
fPRN
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062376p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������P: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062860:)%
#
_user_specified_name	100062858:O K
'
_output_shapes
:���������P
 
_user_specified_nameinputs
�
j
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062835

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
W
#__inference__update_step_xla_842899
gradient"
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:: *
	_noinline(:($
"
_user_specified_name
variable:P L
&
_output_shapes
:
"
_user_specified_name
gradient
�
i
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062401

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
W
#__inference__update_step_xla_842949
gradient"
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:: *
	_noinline(:($
"
_user_specified_name
variable:P L
&
_output_shapes
:
"
_user_specified_name
gradient
�
N
2__inference_teacher_relu_5_layer_call_fn_100062998

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100062448h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
4__inference_teacher_conv2d_3_layer_call_fn_100062912

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *X
fSRQ
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062412w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062908:)%
#
_user_specified_name	100062906:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100063023

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
P
#__inference__update_step_xla_842919
gradient
variable:	P�*
_XlaMustCompile(*(
_construction_contextkEagerRuntime* 
_input_shapes
:	P�: *
	_noinline(:($
"
_user_specified_name
variable:I E

_output_shapes
:	P�
"
_user_specified_name
gradient
�
N
2__inference_teacher_pool_1_layer_call_fn_100062790

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4������������������������������������* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062236�
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�
�
2__inference_teacher_latent_layer_call_fn_100062844

inputs
unknown:	�P
	unknown_0:P
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *V
fQRO
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062361o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������P<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062840:)%
#
_user_specified_name	100062838:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
5__inference_teacher-transpose_layer_call_fn_100062594
teacher_inputs_!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallteacher_inputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8� *Y
fTRR
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062520w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:)%
#
_user_specified_name	100062590:)%
#
_user_specified_name	100062588:)%
#
_user_specified_name	100062586:)%
#
_user_specified_name	100062584:)%
#
_user_specified_name	100062582:)%
#
_user_specified_name	100062580:)
%
#
_user_specified_name	100062578:)	%
#
_user_specified_name	100062576:)%
#
_user_specified_name	100062574:)%
#
_user_specified_name	100062572:)%
#
_user_specified_name	100062570:)%
#
_user_specified_name	100062568:)%
#
_user_specified_name	100062566:)%
#
_user_specified_name	100062564:)%
#
_user_specified_name	100062562:)%
#
_user_specified_name	100062560:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
S
teacher_inputs_@
!serving_default_teacher_inputs_:0���������K
teacher_outputs8
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer_with_weights-1
layer-5
layer-6
layer-7
	layer_with_weights-2
	layer-8

layer_with_weights-3

layer-9
layer-10
layer-11
layer_with_weights-4
layer-12
layer-13
layer_with_weights-5
layer-14
layer_with_weights-6
layer-15
layer-16
layer_with_weights-7
layer-17
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
 __call__
*!&call_and_return_all_conditional_losses"
_tf_keras_layer
�
"	variables
#trainable_variables
$regularization_losses
%	keras_api
&__call__
*'&call_and_return_all_conditional_losses

(kernel
)bias
 *_jit_compiled_convolution_op"
_tf_keras_layer
�
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses"
_tf_keras_layer
�
1	variables
2trainable_variables
3regularization_losses
4	keras_api
5__call__
*6&call_and_return_all_conditional_losses"
_tf_keras_layer
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias
 ?_jit_compiled_convolution_op"
_tf_keras_layer
�
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses"
_tf_keras_layer
�
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses"
_tf_keras_layer
�
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses

Rkernel
Sbias"
_tf_keras_layer
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses

Zkernel
[bias"
_tf_keras_layer
�
\	variables
]trainable_variables
^regularization_losses
_	keras_api
`__call__
*a&call_and_return_all_conditional_losses"
_tf_keras_layer
�
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
f__call__
*g&call_and_return_all_conditional_losses"
_tf_keras_layer
�
h	variables
itrainable_variables
jregularization_losses
k	keras_api
l__call__
*m&call_and_return_all_conditional_losses

nkernel
obias
 p_jit_compiled_convolution_op"
_tf_keras_layer
�
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses"
_tf_keras_layer
�
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{__call__
*|&call_and_return_all_conditional_losses

}kernel
~bias
 _jit_compiled_convolution_op"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
�
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
}10
~11
�12
�13
�14
�15"
trackable_list_wrapper
�
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
}10
~11
�12
�13
�14
�15"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
�trace_0
�trace_12�
5__inference_teacher-transpose_layer_call_fn_100062557
5__inference_teacher-transpose_layer_call_fn_100062594�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
�
�trace_0
�trace_12�
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062467
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062520�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
�B�
$__inference__wrapped_model_100062231teacher_inputs_"�
���
FullArgSpec
args�

jargs_0
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
�
_variables
�_iterations
�_learning_rate
�_index_dict
�
_momentums
�_velocities
�_update_step_xla"
_generic_user_object
-
�serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
 __call__
*!&call_and_return_all_conditional_losses
&!"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
3__inference_teacher_reshape_layer_call_fn_100062742�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062756�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
(0
)1"
trackable_list_wrapper
.
(0
)1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
"	variables
#trainable_variables
$regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
4__inference_teacher_conv2d_1_layer_call_fn_100062765�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062775�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_1/kernel
#:!2teacher_conv2d_1/bias
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_relu_1_layer_call_fn_100062780�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062785�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
1	variables
2trainable_variables
3regularization_losses
5__call__
*6&call_and_return_all_conditional_losses
&6"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_pool_1_layer_call_fn_100062790�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062795�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
=0
>1"
trackable_list_wrapper
.
=0
>1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
4__inference_teacher_conv2d_2_layer_call_fn_100062804�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062814�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_2/kernel
#:!2teacher_conv2d_2/bias
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_relu_2_layer_call_fn_100062819�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062824�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
3__inference_teacher_flatten_layer_call_fn_100062829�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062835�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
R0
S1"
trackable_list_wrapper
.
R0
S1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_latent_layer_call_fn_100062844�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062855�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
(:&	�P2teacher_latent/kernel
!:P2teacher_latent/bias
.
Z0
[1"
trackable_list_wrapper
.
Z0
[1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
1__inference_teacher_dense_layer_call_fn_100062864�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062874�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
':%	P�2teacher_dense/kernel
!:�2teacher_dense/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
\	variables
]trainable_variables
^regularization_losses
`__call__
*a&call_and_return_all_conditional_losses
&a"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
4__inference_teacher_reshape2_layer_call_fn_100062879�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062893�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
b	variables
ctrainable_variables
dregularization_losses
f__call__
*g&call_and_return_all_conditional_losses
&g"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_relu_3_layer_call_fn_100062898�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062903�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
n0
o1"
trackable_list_wrapper
.
n0
o1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
h	variables
itrainable_variables
jregularization_losses
l__call__
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
4__inference_teacher_conv2d_3_layer_call_fn_100062912�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062922�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_3/kernel
#:!2teacher_conv2d_3/bias
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_relu_4_layer_call_fn_100062927�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062932�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
}0
~1"
trackable_list_wrapper
.
}0
~1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
w	variables
xtrainable_variables
yregularization_losses
{__call__
*|&call_and_return_all_conditional_losses
&|"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
:__inference_teacher_conv_transpose_layer_call_fn_100062941�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062974�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
7:52teacher_conv_transpose/kernel
):'2teacher_conv_transpose/bias
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
4__inference_teacher_conv2d_4_layer_call_fn_100062983�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062993�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_4/kernel
#:!2teacher_conv2d_4/bias
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_relu_5_layer_call_fn_100062998�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100063003�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
3__inference_teacher_outputs_layer_call_fn_100063012�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100063023�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
0:.2teacher_outputs/kernel
": 2teacher_outputs/bias
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
5__inference_teacher-transpose_layer_call_fn_100062557teacher_inputs_"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
5__inference_teacher-transpose_layer_call_fn_100062594teacher_inputs_"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062467teacher_inputs_"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062520teacher_inputs_"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
�0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12
�13
�14
�15
�16
�17
�18
�19
�20
�21
�22
�23
�24
�25
�26
�27
�28
�29
�30
�31
�32"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
�
�0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12
�13
�14
�15"
trackable_list_wrapper
�
�0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12
�13
�14
�15"
trackable_list_wrapper
�	
�trace_0
�trace_1
�trace_2
�trace_3
�trace_4
�trace_5
�trace_6
�trace_7
�trace_8
�trace_9
�trace_10
�trace_11
�trace_12
�trace_13
�trace_14
�trace_152�
#__inference__update_step_xla_842889
#__inference__update_step_xla_842894
#__inference__update_step_xla_842899
#__inference__update_step_xla_842904
#__inference__update_step_xla_842909
#__inference__update_step_xla_842914
#__inference__update_step_xla_842919
#__inference__update_step_xla_842924
#__inference__update_step_xla_842929
#__inference__update_step_xla_842934
#__inference__update_step_xla_842939
#__inference__update_step_xla_842944
#__inference__update_step_xla_842949
#__inference__update_step_xla_842954
#__inference__update_step_xla_842959
#__inference__update_step_xla_842964�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0z�trace_0z�trace_1z�trace_2z�trace_3z�trace_4z�trace_5z�trace_6z�trace_7z�trace_8z�trace_9z�trace_10z�trace_11z�trace_12z�trace_13z�trace_14z�trace_15
�B�
'__inference_signature_wrapper_100062737teacher_inputs_"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 $

kwonlyargs�
jteacher_inputs_
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
3__inference_teacher_reshape_layer_call_fn_100062742inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062756inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
4__inference_teacher_conv2d_1_layer_call_fn_100062765inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062775inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_relu_1_layer_call_fn_100062780inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062785inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_pool_1_layer_call_fn_100062790inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062795inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
4__inference_teacher_conv2d_2_layer_call_fn_100062804inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062814inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_relu_2_layer_call_fn_100062819inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062824inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
3__inference_teacher_flatten_layer_call_fn_100062829inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062835inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_latent_layer_call_fn_100062844inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062855inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
1__inference_teacher_dense_layer_call_fn_100062864inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062874inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
4__inference_teacher_reshape2_layer_call_fn_100062879inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062893inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_relu_3_layer_call_fn_100062898inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062903inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
4__inference_teacher_conv2d_3_layer_call_fn_100062912inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062922inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_relu_4_layer_call_fn_100062927inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062932inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
:__inference_teacher_conv_transpose_layer_call_fn_100062941inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062974inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
4__inference_teacher_conv2d_4_layer_call_fn_100062983inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062993inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_relu_5_layer_call_fn_100062998inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100063003inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
3__inference_teacher_outputs_layer_call_fn_100063012inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100063023inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
R
�	variables
�	keras_api

�total

�count"
_tf_keras_metric
6:42Adam/m/teacher_conv2d_1/kernel
6:42Adam/v/teacher_conv2d_1/kernel
(:&2Adam/m/teacher_conv2d_1/bias
(:&2Adam/v/teacher_conv2d_1/bias
6:42Adam/m/teacher_conv2d_2/kernel
6:42Adam/v/teacher_conv2d_2/kernel
(:&2Adam/m/teacher_conv2d_2/bias
(:&2Adam/v/teacher_conv2d_2/bias
-:+	�P2Adam/m/teacher_latent/kernel
-:+	�P2Adam/v/teacher_latent/kernel
&:$P2Adam/m/teacher_latent/bias
&:$P2Adam/v/teacher_latent/bias
,:*	P�2Adam/m/teacher_dense/kernel
,:*	P�2Adam/v/teacher_dense/kernel
&:$�2Adam/m/teacher_dense/bias
&:$�2Adam/v/teacher_dense/bias
6:42Adam/m/teacher_conv2d_3/kernel
6:42Adam/v/teacher_conv2d_3/kernel
(:&2Adam/m/teacher_conv2d_3/bias
(:&2Adam/v/teacher_conv2d_3/bias
<::2$Adam/m/teacher_conv_transpose/kernel
<::2$Adam/v/teacher_conv_transpose/kernel
.:,2"Adam/m/teacher_conv_transpose/bias
.:,2"Adam/v/teacher_conv_transpose/bias
6:42Adam/m/teacher_conv2d_4/kernel
6:42Adam/v/teacher_conv2d_4/kernel
(:&2Adam/m/teacher_conv2d_4/bias
(:&2Adam/v/teacher_conv2d_4/bias
5:32Adam/m/teacher_outputs/kernel
5:32Adam/v/teacher_outputs/kernel
':%2Adam/m/teacher_outputs/bias
':%2Adam/v/teacher_outputs/bias
�B�
#__inference__update_step_xla_842889gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842894gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842899gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842904gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842909gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842914gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842919gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842924gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842929gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842934gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842939gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842944gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842949gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842954gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842959gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
#__inference__update_step_xla_842964gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count�
#__inference__update_step_xla_842889~x�u
n�k
!�
gradient
<�9	%�"
�
�
p
` VariableSpec 
`���Ǆ�?
� "
 �
#__inference__update_step_xla_842894f`�]
V�S
�
gradient
0�-	�
�
�
p
` VariableSpec 
`���Ǆ�?
� "
 �
#__inference__update_step_xla_842899~x�u
n�k
!�
gradient
<�9	%�"
�
�
p
` VariableSpec 
`�ĄȄ�?
� "
 �
#__inference__update_step_xla_842904f`�]
V�S
�
gradient
0�-	�
�
�
p
` VariableSpec 
`���Ȅ�?
� "
 �
#__inference__update_step_xla_842909pj�g
`�]
�
gradient	�P
5�2	�
�	�P
�
p
` VariableSpec 
`���Ǆ�?
� "
 �
#__inference__update_step_xla_842914f`�]
V�S
�
gradientP
0�-	�
�P
�
p
` VariableSpec 
`��Ǆ�?
� "
 �
#__inference__update_step_xla_842919pj�g
`�]
�
gradient	P�
5�2	�
�	P�
�
p
` VariableSpec 
`���Ǆ�?
� "
 �
#__inference__update_step_xla_842924hb�_
X�U
�
gradient�
1�.	�
��
�
p
` VariableSpec 
`��Ǆ�?
� "
 �
#__inference__update_step_xla_842929~x�u
n�k
!�
gradient
<�9	%�"
�
�
p
` VariableSpec 
`෩Ǆ�?
� "
 �
#__inference__update_step_xla_842934f`�]
V�S
�
gradient
0�-	�
�
�
p
` VariableSpec 
`���Ǆ�?
� "
 �
#__inference__update_step_xla_842939~x�u
n�k
!�
gradient
<�9	%�"
�
�
p
` VariableSpec 
`��Ȅ�?
� "
 �
#__inference__update_step_xla_842944f`�]
V�S
�
gradient
0�-	�
�
�
p
` VariableSpec 
`��Ȅ�?
� "
 �
#__inference__update_step_xla_842949~x�u
n�k
!�
gradient
<�9	%�"
�
�
p
` VariableSpec 
`���Ǆ�?
� "
 �
#__inference__update_step_xla_842954f`�]
V�S
�
gradient
0�-	�
�
�
p
` VariableSpec 
`���Ǆ�?
� "
 �
#__inference__update_step_xla_842959~x�u
n�k
!�
gradient
<�9	%�"
�
�
p
` VariableSpec 
`��Ǆ�?
� "
 �
#__inference__update_step_xla_842964f`�]
V�S
�
gradient
0�-	�
�
�
p
` VariableSpec 
`��Ǆ�?
� "
 �
$__inference__wrapped_model_100062231�()=>RSZ[no}~����@�=
6�3
1�.
teacher_inputs_���������
� "I�F
D
teacher_outputs1�.
teacher_outputs����������
'__inference_signature_wrapper_100062737�()=>RSZ[no}~����S�P
� 
I�F
D
teacher_inputs_1�.
teacher_inputs_���������"I�F
D
teacher_outputs1�.
teacher_outputs����������
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062467�()=>RSZ[no}~����H�E
>�;
1�.
teacher_inputs_���������
p

 
� "4�1
*�'
tensor_0���������
� �
P__inference_teacher-transpose_layer_call_and_return_conditional_losses_100062520�()=>RSZ[no}~����H�E
>�;
1�.
teacher_inputs_���������
p 

 
� "4�1
*�'
tensor_0���������
� �
5__inference_teacher-transpose_layer_call_fn_100062557�()=>RSZ[no}~����H�E
>�;
1�.
teacher_inputs_���������
p

 
� ")�&
unknown����������
5__inference_teacher-transpose_layer_call_fn_100062594�()=>RSZ[no}~����H�E
>�;
1�.
teacher_inputs_���������
p 

 
� ")�&
unknown����������
O__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_100062775s()7�4
-�*
(�%
inputs���������
� "4�1
*�'
tensor_0���������
� �
4__inference_teacher_conv2d_1_layer_call_fn_100062765h()7�4
-�*
(�%
inputs���������
� ")�&
unknown����������
O__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_100062814s=>7�4
-�*
(�%
inputs���������	
� "4�1
*�'
tensor_0���������	
� �
4__inference_teacher_conv2d_2_layer_call_fn_100062804h=>7�4
-�*
(�%
inputs���������	
� ")�&
unknown���������	�
O__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_100062922sno7�4
-�*
(�%
inputs���������	
� "4�1
*�'
tensor_0���������	
� �
4__inference_teacher_conv2d_3_layer_call_fn_100062912hno7�4
-�*
(�%
inputs���������	
� ")�&
unknown���������	�
O__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_100062993u��7�4
-�*
(�%
inputs���������
� "4�1
*�'
tensor_0���������
� �
4__inference_teacher_conv2d_4_layer_call_fn_100062983j��7�4
-�*
(�%
inputs���������
� ")�&
unknown����������
U__inference_teacher_conv_transpose_layer_call_and_return_conditional_losses_100062974�}~I�F
?�<
:�7
inputs+���������������������������
� "F�C
<�9
tensor_0+���������������������������
� �
:__inference_teacher_conv_transpose_layer_call_fn_100062941�}~I�F
?�<
:�7
inputs+���������������������������
� ";�8
unknown+����������������������������
L__inference_teacher_dense_layer_call_and_return_conditional_losses_100062874dZ[/�,
%�"
 �
inputs���������P
� "-�*
#� 
tensor_0����������
� �
1__inference_teacher_dense_layer_call_fn_100062864YZ[/�,
%�"
 �
inputs���������P
� ""�
unknown�����������
N__inference_teacher_flatten_layer_call_and_return_conditional_losses_100062835h7�4
-�*
(�%
inputs���������	
� "-�*
#� 
tensor_0����������
� �
3__inference_teacher_flatten_layer_call_fn_100062829]7�4
-�*
(�%
inputs���������	
� ""�
unknown�����������
M__inference_teacher_latent_layer_call_and_return_conditional_losses_100062855dRS0�-
&�#
!�
inputs����������
� ",�)
"�
tensor_0���������P
� �
2__inference_teacher_latent_layer_call_fn_100062844YRS0�-
&�#
!�
inputs����������
� "!�
unknown���������P�
N__inference_teacher_outputs_layer_call_and_return_conditional_losses_100063023u��7�4
-�*
(�%
inputs���������
� "4�1
*�'
tensor_0���������
� �
3__inference_teacher_outputs_layer_call_fn_100063012j��7�4
-�*
(�%
inputs���������
� ")�&
unknown����������
M__inference_teacher_pool_1_layer_call_and_return_conditional_losses_100062795�R�O
H�E
C�@
inputs4������������������������������������
� "O�L
E�B
tensor_04������������������������������������
� �
2__inference_teacher_pool_1_layer_call_fn_100062790�R�O
H�E
C�@
inputs4������������������������������������
� "D�A
unknown4�������������������������������������
M__inference_teacher_relu_1_layer_call_and_return_conditional_losses_100062785o7�4
-�*
(�%
inputs���������
� "4�1
*�'
tensor_0���������
� �
2__inference_teacher_relu_1_layer_call_fn_100062780d7�4
-�*
(�%
inputs���������
� ")�&
unknown����������
M__inference_teacher_relu_2_layer_call_and_return_conditional_losses_100062824o7�4
-�*
(�%
inputs���������	
� "4�1
*�'
tensor_0���������	
� �
2__inference_teacher_relu_2_layer_call_fn_100062819d7�4
-�*
(�%
inputs���������	
� ")�&
unknown���������	�
M__inference_teacher_relu_3_layer_call_and_return_conditional_losses_100062903o7�4
-�*
(�%
inputs���������	
� "4�1
*�'
tensor_0���������	
� �
2__inference_teacher_relu_3_layer_call_fn_100062898d7�4
-�*
(�%
inputs���������	
� ")�&
unknown���������	�
M__inference_teacher_relu_4_layer_call_and_return_conditional_losses_100062932o7�4
-�*
(�%
inputs���������	
� "4�1
*�'
tensor_0���������	
� �
2__inference_teacher_relu_4_layer_call_fn_100062927d7�4
-�*
(�%
inputs���������	
� ")�&
unknown���������	�
M__inference_teacher_relu_5_layer_call_and_return_conditional_losses_100063003o7�4
-�*
(�%
inputs���������
� "4�1
*�'
tensor_0���������
� �
2__inference_teacher_relu_5_layer_call_fn_100062998d7�4
-�*
(�%
inputs���������
� ")�&
unknown����������
O__inference_teacher_reshape2_layer_call_and_return_conditional_losses_100062893h0�-
&�#
!�
inputs����������
� "4�1
*�'
tensor_0���������	
� �
4__inference_teacher_reshape2_layer_call_fn_100062879]0�-
&�#
!�
inputs����������
� ")�&
unknown���������	�
N__inference_teacher_reshape_layer_call_and_return_conditional_losses_100062756o7�4
-�*
(�%
inputs���������
� "4�1
*�'
tensor_0���������
� �
3__inference_teacher_reshape_layer_call_fn_100062742d7�4
-�*
(�%
inputs���������
� ")�&
unknown���������