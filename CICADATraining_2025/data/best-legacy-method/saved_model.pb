��
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
E
AssignAddVariableOp
resource
value"dtype"
dtypetype�
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
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
$
DisableCopyOnRead
resource�
.
Identity

input"T
output"T"	
Ttype
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	
>
Maximum
x"T
y"T
z"T"
Ttype:
2	
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( ""
Ttype:
2	"
Tidxtype0:
2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �
>
Minimum
x"T
y"T
z"T"
Ttype:
2	
?
Mul
x"T
y"T
z"T"
Ttype:
2	�
0
Neg
x"T
y"T"
Ttype:
2
	

NoOp
:
OnesLike
x"T
y"T"
Ttype:
2	

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
8
Pow
x"T
y"T
z"T"
Ttype:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetype�
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
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
2
Round
x"T
y"T"
Ttype:
2
	
.
Rsqrt
x"T
y"T"
Ttype:

2
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
A
SelectV2
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
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	�
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
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
2
StopGradient

input"T
output"T"	
Ttype
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
<
Sub
x"T
y"T
z"T"
Ttype:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "

debug_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.15.02v2.15.0-rc1-8-g6887368d6d48�
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
Adam/v/dense2/kernelVarHandleOp*
_output_shapes
: *%

debug_nameAdam/v/dense2/kernel/*
dtype0*
shape
:*%
shared_nameAdam/v/dense2/kernel
}
(Adam/v/dense2/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense2/kernel*
_output_shapes

:*
dtype0
�
Adam/m/dense2/kernelVarHandleOp*
_output_shapes
: *%

debug_nameAdam/m/dense2/kernel/*
dtype0*
shape
:*%
shared_nameAdam/m/dense2/kernel
}
(Adam/m/dense2/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense2/kernel*
_output_shapes

:*
dtype0
�
(Adam/v/dense1/batch_normalization_5/betaVarHandleOp*
_output_shapes
: *9

debug_name+)Adam/v/dense1/batch_normalization_5/beta/*
dtype0*
shape:*9
shared_name*(Adam/v/dense1/batch_normalization_5/beta
�
<Adam/v/dense1/batch_normalization_5/beta/Read/ReadVariableOpReadVariableOp(Adam/v/dense1/batch_normalization_5/beta*
_output_shapes
:*
dtype0
�
(Adam/m/dense1/batch_normalization_5/betaVarHandleOp*
_output_shapes
: *9

debug_name+)Adam/m/dense1/batch_normalization_5/beta/*
dtype0*
shape:*9
shared_name*(Adam/m/dense1/batch_normalization_5/beta
�
<Adam/m/dense1/batch_normalization_5/beta/Read/ReadVariableOpReadVariableOp(Adam/m/dense1/batch_normalization_5/beta*
_output_shapes
:*
dtype0
�
)Adam/v/dense1/batch_normalization_5/gammaVarHandleOp*
_output_shapes
: *:

debug_name,*Adam/v/dense1/batch_normalization_5/gamma/*
dtype0*
shape:*:
shared_name+)Adam/v/dense1/batch_normalization_5/gamma
�
=Adam/v/dense1/batch_normalization_5/gamma/Read/ReadVariableOpReadVariableOp)Adam/v/dense1/batch_normalization_5/gamma*
_output_shapes
:*
dtype0
�
)Adam/m/dense1/batch_normalization_5/gammaVarHandleOp*
_output_shapes
: *:

debug_name,*Adam/m/dense1/batch_normalization_5/gamma/*
dtype0*
shape:*:
shared_name+)Adam/m/dense1/batch_normalization_5/gamma
�
=Adam/m/dense1/batch_normalization_5/gamma/Read/ReadVariableOpReadVariableOp)Adam/m/dense1/batch_normalization_5/gamma*
_output_shapes
:*
dtype0
�
Adam/v/dense1/biasVarHandleOp*
_output_shapes
: *#

debug_nameAdam/v/dense1/bias/*
dtype0*
shape:*#
shared_nameAdam/v/dense1/bias
u
&Adam/v/dense1/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense1/bias*
_output_shapes
:*
dtype0
�
Adam/m/dense1/biasVarHandleOp*
_output_shapes
: *#

debug_nameAdam/m/dense1/bias/*
dtype0*
shape:*#
shared_nameAdam/m/dense1/bias
u
&Adam/m/dense1/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense1/bias*
_output_shapes
:*
dtype0
�
Adam/v/dense1/kernelVarHandleOp*
_output_shapes
: *%

debug_nameAdam/v/dense1/kernel/*
dtype0*
shape:	�*%
shared_nameAdam/v/dense1/kernel
~
(Adam/v/dense1/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense1/kernel*
_output_shapes
:	�*
dtype0
�
Adam/m/dense1/kernelVarHandleOp*
_output_shapes
: *%

debug_nameAdam/m/dense1/kernel/*
dtype0*
shape:	�*%
shared_nameAdam/m/dense1/kernel
~
(Adam/m/dense1/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense1/kernel*
_output_shapes
:	�*
dtype0
�
Adam/v/conv/kernelVarHandleOp*
_output_shapes
: *#

debug_nameAdam/v/conv/kernel/*
dtype0*
shape:*#
shared_nameAdam/v/conv/kernel
�
&Adam/v/conv/kernel/Read/ReadVariableOpReadVariableOpAdam/v/conv/kernel*&
_output_shapes
:*
dtype0
�
Adam/m/conv/kernelVarHandleOp*
_output_shapes
: *#

debug_nameAdam/m/conv/kernel/*
dtype0*
shape:*#
shared_nameAdam/m/conv/kernel
�
&Adam/m/conv/kernel/Read/ReadVariableOpReadVariableOpAdam/m/conv/kernel*&
_output_shapes
:*
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
,dense1/batch_normalization_5/moving_varianceVarHandleOp*
_output_shapes
: *=

debug_name/-dense1/batch_normalization_5/moving_variance/*
dtype0*
shape:*=
shared_name.,dense1/batch_normalization_5/moving_variance
�
@dense1/batch_normalization_5/moving_variance/Read/ReadVariableOpReadVariableOp,dense1/batch_normalization_5/moving_variance*
_output_shapes
:*
dtype0
�
(dense1/batch_normalization_5/moving_meanVarHandleOp*
_output_shapes
: *9

debug_name+)dense1/batch_normalization_5/moving_mean/*
dtype0*
shape:*9
shared_name*(dense1/batch_normalization_5/moving_mean
�
<dense1/batch_normalization_5/moving_mean/Read/ReadVariableOpReadVariableOp(dense1/batch_normalization_5/moving_mean*
_output_shapes
:*
dtype0
�
!dense1/batch_normalization_5/betaVarHandleOp*
_output_shapes
: *2

debug_name$"dense1/batch_normalization_5/beta/*
dtype0*
shape:*2
shared_name#!dense1/batch_normalization_5/beta
�
5dense1/batch_normalization_5/beta/Read/ReadVariableOpReadVariableOp!dense1/batch_normalization_5/beta*
_output_shapes
:*
dtype0
�
"dense1/batch_normalization_5/gammaVarHandleOp*
_output_shapes
: *3

debug_name%#dense1/batch_normalization_5/gamma/*
dtype0*
shape:*3
shared_name$"dense1/batch_normalization_5/gamma
�
6dense1/batch_normalization_5/gamma/Read/ReadVariableOpReadVariableOp"dense1/batch_normalization_5/gamma*
_output_shapes
:*
dtype0
�
dense2/kernelVarHandleOp*
_output_shapes
: *

debug_namedense2/kernel/*
dtype0*
shape
:*
shared_namedense2/kernel
o
!dense2/kernel/Read/ReadVariableOpReadVariableOpdense2/kernel*
_output_shapes

:*
dtype0
�
dense1/iterationVarHandleOp*
_output_shapes
: *!

debug_namedense1/iteration/*
dtype0	*
shape: *!
shared_namedense1/iteration
m
$dense1/iteration/Read/ReadVariableOpReadVariableOpdense1/iteration*
_output_shapes
: *
dtype0	
�
dense1/biasVarHandleOp*
_output_shapes
: *

debug_namedense1/bias/*
dtype0*
shape:*
shared_namedense1/bias
g
dense1/bias/Read/ReadVariableOpReadVariableOpdense1/bias*
_output_shapes
:*
dtype0
�
dense1/kernelVarHandleOp*
_output_shapes
: *

debug_namedense1/kernel/*
dtype0*
shape:	�*
shared_namedense1/kernel
p
!dense1/kernel/Read/ReadVariableOpReadVariableOpdense1/kernel*
_output_shapes
:	�*
dtype0
�
conv/kernelVarHandleOp*
_output_shapes
: *

debug_nameconv/kernel/*
dtype0*
shape:*
shared_nameconv/kernel
s
conv/kernel/Read/ReadVariableOpReadVariableOpconv/kernel*&
_output_shapes
:*
dtype0
|
serving_default_inputs_Placeholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_inputs_conv/kerneldense1/kerneldense1/bias,dense1/batch_normalization_5/moving_variance"dense1/batch_normalization_5/gamma(dense1/batch_normalization_5/moving_mean!dense1/batch_normalization_5/betadense1/iterationdense2/kernel*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8� *.
f)R'
%__inference_signature_wrapper_1042710

NoOpNoOp
�S
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�R
value�RB�R B�R
�
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer-5
layer_with_weights-1
layer-6
layer-7
	layer-8

layer_with_weights-2

layer-9
layer-10
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses
!kernel_quantizer
!kernel_quantizer_internal
"
quantizers

#kernel
 $_jit_compiled_convolution_op*
�
%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses
+	quantizer* 
�
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses* 
�
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8_random_generator* 
�
9	variables
:trainable_variables
;regularization_losses
<	keras_api
=__call__
*>&call_and_return_all_conditional_losses
?kernel_quantizer
@bias_quantizer
?kernel_quantizer_internal
@bias_quantizer_internal
A
quantizers
B	batchnorm

Ckernel
Dbias
E
_iteration*
�
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses
L	quantizer* 
�
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses
S_random_generator* 
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses
Zkernel_quantizer
Zkernel_quantizer_internal
[
quantizers

\kernel*
�
]	variables
^trainable_variables
_regularization_losses
`	keras_api
a__call__
*b&call_and_return_all_conditional_losses
c	quantizer* 
C
#0
C1
D2
d3
e4
E5
f6
g7
\8*
.
#0
C1
D2
d3
e4
\5*
* 
�
hnon_trainable_variables

ilayers
jmetrics
klayer_regularization_losses
llayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

mtrace_0
ntrace_1* 

otrace_0
ptrace_1* 
* 
�
q
_variables
r_iterations
s_learning_rate
t_index_dict
u
_momentums
v_velocities
w_update_step_xla*

xserving_default* 
* 
* 
* 
�
ynon_trainable_variables

zlayers
{metrics
|layer_regularization_losses
}layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

~trace_0* 

trace_0* 

#0*

#0*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
* 
	
!0* 
[U
VARIABLE_VALUEconv/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
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
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
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
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses* 
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
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses* 

�trace_0
�trace_1* 

�trace_0
�trace_1* 
* 
5
C0
D1
d2
e3
E4
f5
g6*
 
C0
D1
d2
e3*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
9	variables
:trainable_variables
;regularization_losses
=__call__
*>&call_and_return_all_conditional_losses
&>"call_and_return_conditional_losses*

�trace_0
�trace_1* 

�trace_0
�trace_1* 
* 
* 

?0
@1* 
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
	�axis
	dgamma
ebeta
fmoving_mean
gmoving_variance*
]W
VARIABLE_VALUEdense1/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUEdense1/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEdense1/iteration:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUE*
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
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses* 

�trace_0
�trace_1* 

�trace_0
�trace_1* 
* 

\0*

\0*
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
* 
	
Z0* 
]W
VARIABLE_VALUEdense2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
b\
VARIABLE_VALUE"dense1/batch_normalization_5/gamma&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUE!dense1/batch_normalization_5/beta&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUE(dense1/batch_normalization_5/moving_mean&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
lf
VARIABLE_VALUE,dense1/batch_normalization_5/moving_variance&variables/7/.ATTRIBUTES/VARIABLE_VALUE*

E0
f1
g2*
R
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
10*

�0*
* 
* 
* 
* 
* 
* 
n
r0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
4
�0
�1
�2
�3
�4
�5*
4
�0
�1
�2
�3
�4
�5*
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

E0
f1
g2*

B0*
* 
* 
* 
* 
* 
* 
* 
 
d0
e1
f2
g3*

d0
e1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0
�trace_1* 

�trace_0
�trace_1* 
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
�	variables
�	keras_api

�total

�count*
]W
VARIABLE_VALUEAdam/m/conv/kernel1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
]W
VARIABLE_VALUEAdam/v/conv/kernel1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/m/dense1/kernel1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/v/dense1/kernel1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
]W
VARIABLE_VALUEAdam/m/dense1/bias1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
]W
VARIABLE_VALUEAdam/v/dense1/bias1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE)Adam/m/dense1/batch_normalization_5/gamma1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE)Adam/v/dense1/batch_normalization_5/gamma1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUE(Adam/m/dense1/batch_normalization_5/beta1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE(Adam/v/dense1/batch_normalization_5/beta2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/m/dense2/kernel2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/v/dense2/kernel2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUE*

f0
g1*
* 
* 
* 
* 
* 
* 
* 
* 

�0
�1*

�	variables*
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
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenameconv/kerneldense1/kerneldense1/biasdense1/iterationdense2/kernel"dense1/batch_normalization_5/gamma!dense1/batch_normalization_5/beta(dense1/batch_normalization_5/moving_mean,dense1/batch_normalization_5/moving_variance	iterationlearning_rateAdam/m/conv/kernelAdam/v/conv/kernelAdam/m/dense1/kernelAdam/v/dense1/kernelAdam/m/dense1/biasAdam/v/dense1/bias)Adam/m/dense1/batch_normalization_5/gamma)Adam/v/dense1/batch_normalization_5/gamma(Adam/m/dense1/batch_normalization_5/beta(Adam/v/dense1/batch_normalization_5/betaAdam/m/dense2/kernelAdam/v/dense2/kerneltotalcountConst*&
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *)
f$R"
 __inference__traced_save_1043605
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv/kerneldense1/kerneldense1/biasdense1/iterationdense2/kernel"dense1/batch_normalization_5/gamma!dense1/batch_normalization_5/beta(dense1/batch_normalization_5/moving_mean,dense1/batch_normalization_5/moving_variance	iterationlearning_rateAdam/m/conv/kernelAdam/v/conv/kernelAdam/m/dense1/kernelAdam/v/dense1/kernelAdam/m/dense1/biasAdam/v/dense1/bias)Adam/m/dense1/batch_normalization_5/gamma)Adam/v/dense1/batch_normalization_5/gamma(Adam/m/dense1/batch_normalization_5/beta(Adam/v/dense1/batch_normalization_5/betaAdam/m/dense2/kernelAdam/v/dense2/kerneltotalcount*%
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *,
f'R%
#__inference__traced_restore_1043689��
�

f
G__inference_dropout_11_layer_call_and_return_conditional_losses_1042282

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I�?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:���������Q
dropout/ShapeShapeinputs*
T0*
_output_shapes
::���
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:���������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:���������T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    �
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
��
�
"__inference__wrapped_model_1041851
inputs_@
&cicada_v2_conv_readvariableop_resource:B
/cicada_v2_dense1_matmul_readvariableop_resource:	�>
0cicada_v2_dense1_biasadd_readvariableop_resource:V
Hcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_resource:Z
Lcicada_v2_dense1_batch_normalization_5_batchnorm_mul_readvariableop_resource:X
Jcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_1_resource:X
Jcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_2_resource:7
-cicada_v2_dense1_assignaddvariableop_resource:	 :
(cicada_v2_dense2_readvariableop_resource:
identity��cicada-v2/conv/ReadVariableOp�cicada-v2/conv/ReadVariableOp_1�cicada-v2/conv/ReadVariableOp_2�$cicada-v2/dense1/AssignAddVariableOp�'cicada-v2/dense1/BiasAdd/ReadVariableOp�&cicada-v2/dense1/MatMul/ReadVariableOp�cicada-v2/dense1/ReadVariableOp�!cicada-v2/dense1/ReadVariableOp_1�%cicada-v2/dense1/add_2/ReadVariableOp�?cicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp�Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_1�Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_2�Ccicada-v2/dense1/batch_normalization_5/batchnorm/mul/ReadVariableOp�#cicada-v2/dense1/mul/ReadVariableOp�%cicada-v2/dense1/mul_1/ReadVariableOp�%cicada-v2/dense1/mul_3/ReadVariableOp�#cicada-v2/dense1/sub/ReadVariableOp�cicada-v2/dense2/ReadVariableOp�!cicada-v2/dense2/ReadVariableOp_1�!cicada-v2/dense2/ReadVariableOp_2\
cicada-v2/reshape/ShapeShapeinputs_*
T0*
_output_shapes
::��o
%cicada-v2/reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'cicada-v2/reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'cicada-v2/reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
cicada-v2/reshape/strided_sliceStridedSlice cicada-v2/reshape/Shape:output:0.cicada-v2/reshape/strided_slice/stack:output:00cicada-v2/reshape/strided_slice/stack_1:output:00cicada-v2/reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
!cicada-v2/reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :c
!cicada-v2/reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :c
!cicada-v2/reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
cicada-v2/reshape/Reshape/shapePack(cicada-v2/reshape/strided_slice:output:0*cicada-v2/reshape/Reshape/shape/1:output:0*cicada-v2/reshape/Reshape/shape/2:output:0*cicada-v2/reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
cicada-v2/reshape/ReshapeReshapeinputs_(cicada-v2/reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:���������Y
cicada-v2/conv/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Y
cicada-v2/conv/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0Ax
cicada-v2/conv/PowPowcicada-v2/conv/Pow/x:output:0cicada-v2/conv/Pow/y:output:0*
T0*
_output_shapes
: [
cicada-v2/conv/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v2/conv/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@~
cicada-v2/conv/Pow_1Powcicada-v2/conv/Pow_1/x:output:0cicada-v2/conv/Pow_1/y:output:0*
T0*
_output_shapes
: �
cicada-v2/conv/ReadVariableOpReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0�
cicada-v2/conv/mulMul%cicada-v2/conv/ReadVariableOp:value:0cicada-v2/conv/Pow:z:0*
T0*&
_output_shapes
:�
cicada-v2/conv/truedivRealDivcicada-v2/conv/mul:z:0cicada-v2/conv/Pow_1:z:0*
T0*&
_output_shapes
:f
cicada-v2/conv/NegNegcicada-v2/conv/truediv:z:0*
T0*&
_output_shapes
:j
cicada-v2/conv/RoundRoundcicada-v2/conv/truediv:z:0*
T0*&
_output_shapes
:~
cicada-v2/conv/addAddV2cicada-v2/conv/Neg:y:0cicada-v2/conv/Round:y:0*
T0*&
_output_shapes
:t
cicada-v2/conv/StopGradientStopGradientcicada-v2/conv/add:z:0*
T0*&
_output_shapes
:�
cicada-v2/conv/add_1AddV2cicada-v2/conv/truediv:z:0$cicada-v2/conv/StopGradient:output:0*
T0*&
_output_shapes
:T
cicada-v2/conv/Neg_1Negcicada-v2/conv/Pow:z:0*
T0*
_output_shapes
: [
cicada-v2/conv/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?y
cicada-v2/conv/add_2AddV2cicada-v2/conv/Neg_1:y:0cicada-v2/conv/add_2/y:output:0*
T0*
_output_shapes
: [
cicada-v2/conv/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?w
cicada-v2/conv/mul_1Mulcicada-v2/conv/mul_1/x:output:0cicada-v2/conv/add_2:z:0*
T0*
_output_shapes
: Y
cicada-v2/conv/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?q
cicada-v2/conv/subSubcicada-v2/conv/Pow:z:0cicada-v2/conv/sub/y:output:0*
T0*
_output_shapes
: �
$cicada-v2/conv/clip_by_value/MinimumMinimumcicada-v2/conv/add_1:z:0cicada-v2/conv/sub:z:0*
T0*&
_output_shapes
:�
cicada-v2/conv/clip_by_valueMaximum(cicada-v2/conv/clip_by_value/Minimum:z:0cicada-v2/conv/mul_1:z:0*
T0*&
_output_shapes
:�
cicada-v2/conv/mul_2Mulcicada-v2/conv/Pow_1:z:0 cicada-v2/conv/clip_by_value:z:0*
T0*&
_output_shapes
:�
cicada-v2/conv/truediv_1RealDivcicada-v2/conv/mul_2:z:0cicada-v2/conv/Pow:z:0*
T0*&
_output_shapes
:[
cicada-v2/conv/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/conv/mul_3Mulcicada-v2/conv/mul_3/x:output:0cicada-v2/conv/truediv_1:z:0*
T0*&
_output_shapes
:�
cicada-v2/conv/ReadVariableOp_1ReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0u
cicada-v2/conv/Neg_2Neg'cicada-v2/conv/ReadVariableOp_1:value:0*
T0*&
_output_shapes
:�
cicada-v2/conv/add_3AddV2cicada-v2/conv/Neg_2:y:0cicada-v2/conv/mul_3:z:0*
T0*&
_output_shapes
:[
cicada-v2/conv/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/conv/mul_4Mulcicada-v2/conv/mul_4/x:output:0cicada-v2/conv/add_3:z:0*
T0*&
_output_shapes
:x
cicada-v2/conv/StopGradient_1StopGradientcicada-v2/conv/mul_4:z:0*
T0*&
_output_shapes
:�
cicada-v2/conv/ReadVariableOp_2ReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0�
cicada-v2/conv/add_4AddV2'cicada-v2/conv/ReadVariableOp_2:value:0&cicada-v2/conv/StopGradient_1:output:0*
T0*&
_output_shapes
:�
cicada-v2/conv/convolutionConv2D"cicada-v2/reshape/Reshape:output:0cicada-v2/conv/add_4:z:0*
T0*/
_output_shapes
:���������	*
paddingVALID*
strides
W
cicada-v2/relu0/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :W
cicada-v2/relu0/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
{
cicada-v2/relu0/PowPowcicada-v2/relu0/Pow/x:output:0cicada-v2/relu0/Pow/y:output:0*
T0*
_output_shapes
: e
cicada-v2/relu0/CastCastcicada-v2/relu0/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Y
cicada-v2/relu0/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v2/relu0/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada-v2/relu0/Pow_1Pow cicada-v2/relu0/Pow_1/x:output:0 cicada-v2/relu0/Pow_1/y:output:0*
T0*
_output_shapes
: i
cicada-v2/relu0/Cast_1Castcicada-v2/relu0/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu0/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @Z
cicada-v2/relu0/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :q
cicada-v2/relu0/Cast_2Cast!cicada-v2/relu0/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu0/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   Aw
cicada-v2/relu0/subSubcicada-v2/relu0/Cast_2:y:0cicada-v2/relu0/sub/y:output:0*
T0*
_output_shapes
: v
cicada-v2/relu0/Pow_2Powcicada-v2/relu0/Const:output:0cicada-v2/relu0/sub:z:0*
T0*
_output_shapes
: t
cicada-v2/relu0/sub_1Subcicada-v2/relu0/Cast_1:y:0cicada-v2/relu0/Pow_2:z:0*
T0*
_output_shapes
: �
cicada-v2/relu0/LessEqual	LessEqual#cicada-v2/conv/convolution:output:0cicada-v2/relu0/sub_1:z:0*
T0*/
_output_shapes
:���������	{
cicada-v2/relu0/ReluRelu#cicada-v2/conv/convolution:output:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/ones_likeOnesLike#cicada-v2/conv/convolution:output:0*
T0*/
_output_shapes
:���������	t
cicada-v2/relu0/sub_2Subcicada-v2/relu0/Cast_1:y:0cicada-v2/relu0/Pow_2:z:0*
T0*
_output_shapes
: �
cicada-v2/relu0/mulMulcicada-v2/relu0/ones_like:y:0cicada-v2/relu0/sub_2:z:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/SelectV2SelectV2cicada-v2/relu0/LessEqual:z:0"cicada-v2/relu0/Relu:activations:0cicada-v2/relu0/mul:z:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/mul_1Mul#cicada-v2/conv/convolution:output:0cicada-v2/relu0/Cast:y:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/truedivRealDivcicada-v2/relu0/mul_1:z:0cicada-v2/relu0/Cast_1:y:0*
T0*/
_output_shapes
:���������	q
cicada-v2/relu0/NegNegcicada-v2/relu0/truediv:z:0*
T0*/
_output_shapes
:���������	u
cicada-v2/relu0/RoundRoundcicada-v2/relu0/truediv:z:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/addAddV2cicada-v2/relu0/Neg:y:0cicada-v2/relu0/Round:y:0*
T0*/
_output_shapes
:���������	
cicada-v2/relu0/StopGradientStopGradientcicada-v2/relu0/add:z:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/add_1AddV2cicada-v2/relu0/truediv:z:0%cicada-v2/relu0/StopGradient:output:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/truediv_1RealDivcicada-v2/relu0/add_1:z:0cicada-v2/relu0/Cast:y:0*
T0*/
_output_shapes
:���������	`
cicada-v2/relu0/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/relu0/truediv_2RealDiv$cicada-v2/relu0/truediv_2/x:output:0cicada-v2/relu0/Cast:y:0*
T0*
_output_shapes
: \
cicada-v2/relu0/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?~
cicada-v2/relu0/sub_3Sub cicada-v2/relu0/sub_3/x:output:0cicada-v2/relu0/truediv_2:z:0*
T0*
_output_shapes
: �
%cicada-v2/relu0/clip_by_value/MinimumMinimumcicada-v2/relu0/truediv_1:z:0cicada-v2/relu0/sub_3:z:0*
T0*/
_output_shapes
:���������	d
cicada-v2/relu0/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
cicada-v2/relu0/clip_by_valueMaximum)cicada-v2/relu0/clip_by_value/Minimum:z:0(cicada-v2/relu0/clip_by_value/y:output:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/mul_2Mulcicada-v2/relu0/Cast_1:y:0!cicada-v2/relu0/clip_by_value:z:0*
T0*/
_output_shapes
:���������	y
cicada-v2/relu0/Neg_1Neg!cicada-v2/relu0/SelectV2:output:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/add_2AddV2cicada-v2/relu0/Neg_1:y:0cicada-v2/relu0/mul_2:z:0*
T0*/
_output_shapes
:���������	\
cicada-v2/relu0/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/relu0/mul_3Mul cicada-v2/relu0/mul_3/x:output:0cicada-v2/relu0/add_2:z:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/StopGradient_1StopGradientcicada-v2/relu0/mul_3:z:0*
T0*/
_output_shapes
:���������	�
cicada-v2/relu0/add_3AddV2!cicada-v2/relu0/SelectV2:output:0'cicada-v2/relu0/StopGradient_1:output:0*
T0*/
_output_shapes
:���������	h
cicada-v2/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   �
cicada-v2/flatten/ReshapeReshapecicada-v2/relu0/add_3:z:0 cicada-v2/flatten/Const:output:0*
T0*(
_output_shapes
:�����������
cicada-v2/dropout_10/IdentityIdentity"cicada-v2/flatten/Reshape:output:0*
T0*(
_output_shapes
:����������Y
cicada-v2/dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z �
&cicada-v2/dense1/MatMul/ReadVariableOpReadVariableOp/cicada_v2_dense1_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
cicada-v2/dense1/MatMulMatMul&cicada-v2/dropout_10/Identity:output:0.cicada-v2/dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
'cicada-v2/dense1/BiasAdd/ReadVariableOpReadVariableOp0cicada_v2_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
cicada-v2/dense1/BiasAddBiasAdd!cicada-v2/dense1/MatMul:product:0/cicada-v2/dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
?cicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOpReadVariableOpHcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0{
6cicada-v2/dense1/batch_normalization_5/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
4cicada-v2/dense1/batch_normalization_5/batchnorm/addAddV2Gcicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp:value:0?cicada-v2/dense1/batch_normalization_5/batchnorm/add/y:output:0*
T0*
_output_shapes
:�
6cicada-v2/dense1/batch_normalization_5/batchnorm/RsqrtRsqrt8cicada-v2/dense1/batch_normalization_5/batchnorm/add:z:0*
T0*
_output_shapes
:�
Ccicada-v2/dense1/batch_normalization_5/batchnorm/mul/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0�
4cicada-v2/dense1/batch_normalization_5/batchnorm/mulMul:cicada-v2/dense1/batch_normalization_5/batchnorm/Rsqrt:y:0Kcicada-v2/dense1/batch_normalization_5/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
6cicada-v2/dense1/batch_normalization_5/batchnorm/mul_1Mul!cicada-v2/dense1/BiasAdd:output:08cicada-v2/dense1/batch_normalization_5/batchnorm/mul:z:0*
T0*'
_output_shapes
:����������
Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_1ReadVariableOpJcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0�
6cicada-v2/dense1/batch_normalization_5/batchnorm/mul_2MulIcicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_1:value:08cicada-v2/dense1/batch_normalization_5/batchnorm/mul:z:0*
T0*
_output_shapes
:�
Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_2ReadVariableOpJcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0�
4cicada-v2/dense1/batch_normalization_5/batchnorm/subSubIcicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_2:value:0:cicada-v2/dense1/batch_normalization_5/batchnorm/mul_2:z:0*
T0*
_output_shapes
:�
6cicada-v2/dense1/batch_normalization_5/batchnorm/add_1AddV2:cicada-v2/dense1/batch_normalization_5/batchnorm/mul_1:z:08cicada-v2/dense1/batch_normalization_5/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������X
cicada-v2/dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R �
$cicada-v2/dense1/AssignAddVariableOpAssignAddVariableOp-cicada_v2_dense1_assignaddvariableop_resourcecicada-v2/dense1/Const:output:0*
_output_shapes
 *
dtype0	y
/cicada-v2/dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
cicada-v2/dense1/moments/meanMean!cicada-v2/dense1/BiasAdd:output:08cicada-v2/dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(�
%cicada-v2/dense1/moments/StopGradientStopGradient&cicada-v2/dense1/moments/mean:output:0*
T0*
_output_shapes

:�
*cicada-v2/dense1/moments/SquaredDifferenceSquaredDifference!cicada-v2/dense1/BiasAdd:output:0.cicada-v2/dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:���������}
3cicada-v2/dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
!cicada-v2/dense1/moments/varianceMean.cicada-v2/dense1/moments/SquaredDifference:z:0<cicada-v2/dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(�
 cicada-v2/dense1/moments/SqueezeSqueeze&cicada-v2/dense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
"cicada-v2/dense1/moments/Squeeze_1Squeeze*cicada-v2/dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
cicada-v2/dense1/ReadVariableOpReadVariableOpHcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0[
cicada-v2/dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
cicada-v2/dense1/addAddV2'cicada-v2/dense1/ReadVariableOp:value:0cicada-v2/dense1/add/y:output:0*
T0*
_output_shapes
:^
cicada-v2/dense1/RsqrtRsqrtcicada-v2/dense1/add:z:0*
T0*
_output_shapes
:]
cicada-v2/dense1/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
cicada-v2/dense1/add_1AddV2+cicada-v2/dense1/moments/Squeeze_1:output:0!cicada-v2/dense1/add_1/y:output:0*
T0*
_output_shapes
:b
cicada-v2/dense1/Rsqrt_1Rsqrtcicada-v2/dense1/add_1:z:0*
T0*
_output_shapes
:�
#cicada-v2/dense1/mul/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0�
cicada-v2/dense1/mulMulcicada-v2/dense1/Rsqrt:y:0+cicada-v2/dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
%cicada-v2/dense1/mul_1/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0�
cicada-v2/dense1/mul_1Mulcicada-v2/dense1/Rsqrt_1:y:0-cicada-v2/dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:�
!cicada-v2/dense1/ReadVariableOp_1ReadVariableOp0cicada_v2_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
#cicada-v2/dense1/sub/ReadVariableOpReadVariableOpJcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0�
cicada-v2/dense1/subSub)cicada-v2/dense1/ReadVariableOp_1:value:0+cicada-v2/dense1/sub/ReadVariableOp:value:0*
T0*
_output_shapes
:v
cicada-v2/dense1/mul_2Mulcicada-v2/dense1/mul:z:0cicada-v2/dense1/sub:z:0*
T0*
_output_shapes
:�
%cicada-v2/dense1/add_2/ReadVariableOpReadVariableOpJcicada_v2_dense1_batch_normalization_5_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0�
cicada-v2/dense1/add_2AddV2cicada-v2/dense1/mul_2:z:0-cicada-v2/dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:�
%cicada-v2/dense1/mul_3/ReadVariableOpReadVariableOp/cicada_v2_dense1_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
cicada-v2/dense1/mul_3Mulcicada-v2/dense1/mul:z:0-cicada-v2/dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	�[
cicada-v2/dense1/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v2/dense1/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@~
cicada-v2/dense1/PowPowcicada-v2/dense1/Pow/x:output:0cicada-v2/dense1/Pow/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense1/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense1/Pow_1Pow!cicada-v2/dense1/Pow_1/x:output:0!cicada-v2/dense1/Pow_1/y:output:0*
T0*
_output_shapes
: }
cicada-v2/dense1/mul_4Mulcicada-v2/dense1/mul_3:z:0cicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
:	��
cicada-v2/dense1/truedivRealDivcicada-v2/dense1/mul_4:z:0cicada-v2/dense1/Pow_1:z:0*
T0*
_output_shapes
:	�c
cicada-v2/dense1/NegNegcicada-v2/dense1/truediv:z:0*
T0*
_output_shapes
:	�g
cicada-v2/dense1/RoundRoundcicada-v2/dense1/truediv:z:0*
T0*
_output_shapes
:	�
cicada-v2/dense1/add_3AddV2cicada-v2/dense1/Neg:y:0cicada-v2/dense1/Round:y:0*
T0*
_output_shapes
:	�s
cicada-v2/dense1/StopGradientStopGradientcicada-v2/dense1/add_3:z:0*
T0*
_output_shapes
:	��
cicada-v2/dense1/add_4AddV2cicada-v2/dense1/truediv:z:0&cicada-v2/dense1/StopGradient:output:0*
T0*
_output_shapes
:	�X
cicada-v2/dense1/Neg_1Negcicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?
cicada-v2/dense1/add_5AddV2cicada-v2/dense1/Neg_1:y:0!cicada-v2/dense1/add_5/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?}
cicada-v2/dense1/mul_5Mul!cicada-v2/dense1/mul_5/x:output:0cicada-v2/dense1/add_5:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?{
cicada-v2/dense1/sub_1Subcicada-v2/dense1/Pow:z:0!cicada-v2/dense1/sub_1/y:output:0*
T0*
_output_shapes
: �
&cicada-v2/dense1/clip_by_value/MinimumMinimumcicada-v2/dense1/add_4:z:0cicada-v2/dense1/sub_1:z:0*
T0*
_output_shapes
:	��
cicada-v2/dense1/clip_by_valueMaximum*cicada-v2/dense1/clip_by_value/Minimum:z:0cicada-v2/dense1/mul_5:z:0*
T0*
_output_shapes
:	��
cicada-v2/dense1/mul_6Mulcicada-v2/dense1/Pow_1:z:0"cicada-v2/dense1/clip_by_value:z:0*
T0*
_output_shapes
:	��
cicada-v2/dense1/truediv_1RealDivcicada-v2/dense1/mul_6:z:0cicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
:	�]
cicada-v2/dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense1/mul_7Mul!cicada-v2/dense1/mul_7/x:output:0cicada-v2/dense1/truediv_1:z:0*
T0*
_output_shapes
:	�c
cicada-v2/dense1/Neg_2Negcicada-v2/dense1/mul_3:z:0*
T0*
_output_shapes
:	��
cicada-v2/dense1/add_6AddV2cicada-v2/dense1/Neg_2:y:0cicada-v2/dense1/mul_7:z:0*
T0*
_output_shapes
:	�]
cicada-v2/dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense1/mul_8Mul!cicada-v2/dense1/mul_8/x:output:0cicada-v2/dense1/add_6:z:0*
T0*
_output_shapes
:	�u
cicada-v2/dense1/StopGradient_1StopGradientcicada-v2/dense1/mul_8:z:0*
T0*
_output_shapes
:	��
cicada-v2/dense1/add_7AddV2cicada-v2/dense1/mul_3:z:0(cicada-v2/dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	�]
cicada-v2/dense1/Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense1/Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@�
cicada-v2/dense1/Pow_2Pow!cicada-v2/dense1/Pow_2/x:output:0!cicada-v2/dense1/Pow_2/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense1/Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@�
cicada-v2/dense1/Pow_3Pow!cicada-v2/dense1/Pow_3/x:output:0!cicada-v2/dense1/Pow_3/y:output:0*
T0*
_output_shapes
: z
cicada-v2/dense1/mul_9Mulcicada-v2/dense1/add_2:z:0cicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
:�
cicada-v2/dense1/truediv_2RealDivcicada-v2/dense1/mul_9:z:0cicada-v2/dense1/Pow_3:z:0*
T0*
_output_shapes
:b
cicada-v2/dense1/Neg_3Negcicada-v2/dense1/truediv_2:z:0*
T0*
_output_shapes
:f
cicada-v2/dense1/Round_1Roundcicada-v2/dense1/truediv_2:z:0*
T0*
_output_shapes
:~
cicada-v2/dense1/add_8AddV2cicada-v2/dense1/Neg_3:y:0cicada-v2/dense1/Round_1:y:0*
T0*
_output_shapes
:p
cicada-v2/dense1/StopGradient_2StopGradientcicada-v2/dense1/add_8:z:0*
T0*
_output_shapes
:�
cicada-v2/dense1/add_9AddV2cicada-v2/dense1/truediv_2:z:0(cicada-v2/dense1/StopGradient_2:output:0*
T0*
_output_shapes
:Z
cicada-v2/dense1/Neg_4Negcicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
: ^
cicada-v2/dense1/add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense1/add_10AddV2cicada-v2/dense1/Neg_4:y:0"cicada-v2/dense1/add_10/y:output:0*
T0*
_output_shapes
: ^
cicada-v2/dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense1/mul_10Mul"cicada-v2/dense1/mul_10/x:output:0cicada-v2/dense1/add_10:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?}
cicada-v2/dense1/sub_2Subcicada-v2/dense1/Pow_2:z:0!cicada-v2/dense1/sub_2/y:output:0*
T0*
_output_shapes
: �
(cicada-v2/dense1/clip_by_value_1/MinimumMinimumcicada-v2/dense1/add_9:z:0cicada-v2/dense1/sub_2:z:0*
T0*
_output_shapes
:�
 cicada-v2/dense1/clip_by_value_1Maximum,cicada-v2/dense1/clip_by_value_1/Minimum:z:0cicada-v2/dense1/mul_10:z:0*
T0*
_output_shapes
:�
cicada-v2/dense1/mul_11Mulcicada-v2/dense1/Pow_3:z:0$cicada-v2/dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:�
cicada-v2/dense1/truediv_3RealDivcicada-v2/dense1/mul_11:z:0cicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
:^
cicada-v2/dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense1/mul_12Mul"cicada-v2/dense1/mul_12/x:output:0cicada-v2/dense1/truediv_3:z:0*
T0*
_output_shapes
:^
cicada-v2/dense1/Neg_5Negcicada-v2/dense1/add_2:z:0*
T0*
_output_shapes
:~
cicada-v2/dense1/add_11AddV2cicada-v2/dense1/Neg_5:y:0cicada-v2/dense1/mul_12:z:0*
T0*
_output_shapes
:^
cicada-v2/dense1/mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense1/mul_13Mul"cicada-v2/dense1/mul_13/x:output:0cicada-v2/dense1/add_11:z:0*
T0*
_output_shapes
:q
cicada-v2/dense1/StopGradient_3StopGradientcicada-v2/dense1/mul_13:z:0*
T0*
_output_shapes
:�
cicada-v2/dense1/add_12AddV2cicada-v2/dense1/add_2:z:0(cicada-v2/dense1/StopGradient_3:output:0*
T0*
_output_shapes
:�
cicada-v2/dense1/MatMul_1MatMul&cicada-v2/dropout_10/Identity:output:0cicada-v2/dense1/add_7:z:0*
T0*'
_output_shapes
:����������
cicada-v2/dense1/BiasAdd_1BiasAdd#cicada-v2/dense1/MatMul_1:product:0cicada-v2/dense1/add_12:z:0*
T0*'
_output_shapes
:���������W
cicada-v2/relu1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :W
cicada-v2/relu1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
{
cicada-v2/relu1/PowPowcicada-v2/relu1/Pow/x:output:0cicada-v2/relu1/Pow/y:output:0*
T0*
_output_shapes
: e
cicada-v2/relu1/CastCastcicada-v2/relu1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Y
cicada-v2/relu1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v2/relu1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada-v2/relu1/Pow_1Pow cicada-v2/relu1/Pow_1/x:output:0 cicada-v2/relu1/Pow_1/y:output:0*
T0*
_output_shapes
: i
cicada-v2/relu1/Cast_1Castcicada-v2/relu1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @Z
cicada-v2/relu1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :q
cicada-v2/relu1/Cast_2Cast!cicada-v2/relu1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   Aw
cicada-v2/relu1/subSubcicada-v2/relu1/Cast_2:y:0cicada-v2/relu1/sub/y:output:0*
T0*
_output_shapes
: v
cicada-v2/relu1/Pow_2Powcicada-v2/relu1/Const:output:0cicada-v2/relu1/sub:z:0*
T0*
_output_shapes
: t
cicada-v2/relu1/sub_1Subcicada-v2/relu1/Cast_1:y:0cicada-v2/relu1/Pow_2:z:0*
T0*
_output_shapes
: �
cicada-v2/relu1/LessEqual	LessEqual#cicada-v2/dense1/BiasAdd_1:output:0cicada-v2/relu1/sub_1:z:0*
T0*'
_output_shapes
:���������s
cicada-v2/relu1/ReluRelu#cicada-v2/dense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:���������|
cicada-v2/relu1/ones_likeOnesLike#cicada-v2/dense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:���������t
cicada-v2/relu1/sub_2Subcicada-v2/relu1/Cast_1:y:0cicada-v2/relu1/Pow_2:z:0*
T0*
_output_shapes
: �
cicada-v2/relu1/mulMulcicada-v2/relu1/ones_like:y:0cicada-v2/relu1/sub_2:z:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/SelectV2SelectV2cicada-v2/relu1/LessEqual:z:0"cicada-v2/relu1/Relu:activations:0cicada-v2/relu1/mul:z:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/mul_1Mul#cicada-v2/dense1/BiasAdd_1:output:0cicada-v2/relu1/Cast:y:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/truedivRealDivcicada-v2/relu1/mul_1:z:0cicada-v2/relu1/Cast_1:y:0*
T0*'
_output_shapes
:���������i
cicada-v2/relu1/NegNegcicada-v2/relu1/truediv:z:0*
T0*'
_output_shapes
:���������m
cicada-v2/relu1/RoundRoundcicada-v2/relu1/truediv:z:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/addAddV2cicada-v2/relu1/Neg:y:0cicada-v2/relu1/Round:y:0*
T0*'
_output_shapes
:���������w
cicada-v2/relu1/StopGradientStopGradientcicada-v2/relu1/add:z:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/add_1AddV2cicada-v2/relu1/truediv:z:0%cicada-v2/relu1/StopGradient:output:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/truediv_1RealDivcicada-v2/relu1/add_1:z:0cicada-v2/relu1/Cast:y:0*
T0*'
_output_shapes
:���������`
cicada-v2/relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/relu1/truediv_2RealDiv$cicada-v2/relu1/truediv_2/x:output:0cicada-v2/relu1/Cast:y:0*
T0*
_output_shapes
: \
cicada-v2/relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?~
cicada-v2/relu1/sub_3Sub cicada-v2/relu1/sub_3/x:output:0cicada-v2/relu1/truediv_2:z:0*
T0*
_output_shapes
: �
%cicada-v2/relu1/clip_by_value/MinimumMinimumcicada-v2/relu1/truediv_1:z:0cicada-v2/relu1/sub_3:z:0*
T0*'
_output_shapes
:���������d
cicada-v2/relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
cicada-v2/relu1/clip_by_valueMaximum)cicada-v2/relu1/clip_by_value/Minimum:z:0(cicada-v2/relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/mul_2Mulcicada-v2/relu1/Cast_1:y:0!cicada-v2/relu1/clip_by_value:z:0*
T0*'
_output_shapes
:���������q
cicada-v2/relu1/Neg_1Neg!cicada-v2/relu1/SelectV2:output:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/add_2AddV2cicada-v2/relu1/Neg_1:y:0cicada-v2/relu1/mul_2:z:0*
T0*'
_output_shapes
:���������\
cicada-v2/relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/relu1/mul_3Mul cicada-v2/relu1/mul_3/x:output:0cicada-v2/relu1/add_2:z:0*
T0*'
_output_shapes
:���������{
cicada-v2/relu1/StopGradient_1StopGradientcicada-v2/relu1/mul_3:z:0*
T0*'
_output_shapes
:����������
cicada-v2/relu1/add_3AddV2!cicada-v2/relu1/SelectV2:output:0'cicada-v2/relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:���������v
cicada-v2/dropout_11/IdentityIdentitycicada-v2/relu1/add_3:z:0*
T0*'
_output_shapes
:���������[
cicada-v2/dense2/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v2/dense2/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0A~
cicada-v2/dense2/PowPowcicada-v2/dense2/Pow/x:output:0cicada-v2/dense2/Pow/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense2/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense2/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@�
cicada-v2/dense2/Pow_1Pow!cicada-v2/dense2/Pow_1/x:output:0!cicada-v2/dense2/Pow_1/y:output:0*
T0*
_output_shapes
: �
cicada-v2/dense2/ReadVariableOpReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0�
cicada-v2/dense2/mulMul'cicada-v2/dense2/ReadVariableOp:value:0cicada-v2/dense2/Pow:z:0*
T0*
_output_shapes

:�
cicada-v2/dense2/truedivRealDivcicada-v2/dense2/mul:z:0cicada-v2/dense2/Pow_1:z:0*
T0*
_output_shapes

:b
cicada-v2/dense2/NegNegcicada-v2/dense2/truediv:z:0*
T0*
_output_shapes

:f
cicada-v2/dense2/RoundRoundcicada-v2/dense2/truediv:z:0*
T0*
_output_shapes

:|
cicada-v2/dense2/addAddV2cicada-v2/dense2/Neg:y:0cicada-v2/dense2/Round:y:0*
T0*
_output_shapes

:p
cicada-v2/dense2/StopGradientStopGradientcicada-v2/dense2/add:z:0*
T0*
_output_shapes

:�
cicada-v2/dense2/add_1AddV2cicada-v2/dense2/truediv:z:0&cicada-v2/dense2/StopGradient:output:0*
T0*
_output_shapes

:X
cicada-v2/dense2/Neg_1Negcicada-v2/dense2/Pow:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense2/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?
cicada-v2/dense2/add_2AddV2cicada-v2/dense2/Neg_1:y:0!cicada-v2/dense2/add_2/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?}
cicada-v2/dense2/mul_1Mul!cicada-v2/dense2/mul_1/x:output:0cicada-v2/dense2/add_2:z:0*
T0*
_output_shapes
: [
cicada-v2/dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?w
cicada-v2/dense2/subSubcicada-v2/dense2/Pow:z:0cicada-v2/dense2/sub/y:output:0*
T0*
_output_shapes
: �
&cicada-v2/dense2/clip_by_value/MinimumMinimumcicada-v2/dense2/add_1:z:0cicada-v2/dense2/sub:z:0*
T0*
_output_shapes

:�
cicada-v2/dense2/clip_by_valueMaximum*cicada-v2/dense2/clip_by_value/Minimum:z:0cicada-v2/dense2/mul_1:z:0*
T0*
_output_shapes

:�
cicada-v2/dense2/mul_2Mulcicada-v2/dense2/Pow_1:z:0"cicada-v2/dense2/clip_by_value:z:0*
T0*
_output_shapes

:�
cicada-v2/dense2/truediv_1RealDivcicada-v2/dense2/mul_2:z:0cicada-v2/dense2/Pow:z:0*
T0*
_output_shapes

:]
cicada-v2/dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense2/mul_3Mul!cicada-v2/dense2/mul_3/x:output:0cicada-v2/dense2/truediv_1:z:0*
T0*
_output_shapes

:�
!cicada-v2/dense2/ReadVariableOp_1ReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0q
cicada-v2/dense2/Neg_2Neg)cicada-v2/dense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:�
cicada-v2/dense2/add_3AddV2cicada-v2/dense2/Neg_2:y:0cicada-v2/dense2/mul_3:z:0*
T0*
_output_shapes

:]
cicada-v2/dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/dense2/mul_4Mul!cicada-v2/dense2/mul_4/x:output:0cicada-v2/dense2/add_3:z:0*
T0*
_output_shapes

:t
cicada-v2/dense2/StopGradient_1StopGradientcicada-v2/dense2/mul_4:z:0*
T0*
_output_shapes

:�
!cicada-v2/dense2/ReadVariableOp_2ReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0�
cicada-v2/dense2/add_4AddV2)cicada-v2/dense2/ReadVariableOp_2:value:0(cicada-v2/dense2/StopGradient_1:output:0*
T0*
_output_shapes

:�
cicada-v2/dense2/MatMulMatMul&cicada-v2/dropout_11/Identity:output:0cicada-v2/dense2/add_4:z:0*
T0*'
_output_shapes
:���������Y
cicada-v2/outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v2/outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada-v2/outputs/PowPow cicada-v2/outputs/Pow/x:output:0 cicada-v2/outputs/Pow/y:output:0*
T0*
_output_shapes
: i
cicada-v2/outputs/CastCastcicada-v2/outputs/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: [
cicada-v2/outputs/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :[
cicada-v2/outputs/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada-v2/outputs/Pow_1Pow"cicada-v2/outputs/Pow_1/x:output:0"cicada-v2/outputs/Pow_1/y:output:0*
T0*
_output_shapes
: m
cicada-v2/outputs/Cast_1Castcicada-v2/outputs/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: \
cicada-v2/outputs/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @\
cicada-v2/outputs/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :u
cicada-v2/outputs/Cast_2Cast#cicada-v2/outputs/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: \
cicada-v2/outputs/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �A}
cicada-v2/outputs/subSubcicada-v2/outputs/Cast_2:y:0 cicada-v2/outputs/sub/y:output:0*
T0*
_output_shapes
: |
cicada-v2/outputs/Pow_2Pow cicada-v2/outputs/Const:output:0cicada-v2/outputs/sub:z:0*
T0*
_output_shapes
: z
cicada-v2/outputs/sub_1Subcicada-v2/outputs/Cast_1:y:0cicada-v2/outputs/Pow_2:z:0*
T0*
_output_shapes
: �
cicada-v2/outputs/LessEqual	LessEqual!cicada-v2/dense2/MatMul:product:0cicada-v2/outputs/sub_1:z:0*
T0*'
_output_shapes
:���������s
cicada-v2/outputs/ReluRelu!cicada-v2/dense2/MatMul:product:0*
T0*'
_output_shapes
:���������|
cicada-v2/outputs/ones_likeOnesLike!cicada-v2/dense2/MatMul:product:0*
T0*'
_output_shapes
:���������z
cicada-v2/outputs/sub_2Subcicada-v2/outputs/Cast_1:y:0cicada-v2/outputs/Pow_2:z:0*
T0*
_output_shapes
: �
cicada-v2/outputs/mulMulcicada-v2/outputs/ones_like:y:0cicada-v2/outputs/sub_2:z:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/SelectV2SelectV2cicada-v2/outputs/LessEqual:z:0$cicada-v2/outputs/Relu:activations:0cicada-v2/outputs/mul:z:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/mul_1Mul!cicada-v2/dense2/MatMul:product:0cicada-v2/outputs/Cast:y:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/truedivRealDivcicada-v2/outputs/mul_1:z:0cicada-v2/outputs/Cast_1:y:0*
T0*'
_output_shapes
:���������m
cicada-v2/outputs/NegNegcicada-v2/outputs/truediv:z:0*
T0*'
_output_shapes
:���������q
cicada-v2/outputs/RoundRoundcicada-v2/outputs/truediv:z:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/addAddV2cicada-v2/outputs/Neg:y:0cicada-v2/outputs/Round:y:0*
T0*'
_output_shapes
:���������{
cicada-v2/outputs/StopGradientStopGradientcicada-v2/outputs/add:z:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/add_1AddV2cicada-v2/outputs/truediv:z:0'cicada-v2/outputs/StopGradient:output:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/truediv_1RealDivcicada-v2/outputs/add_1:z:0cicada-v2/outputs/Cast:y:0*
T0*'
_output_shapes
:���������b
cicada-v2/outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/outputs/truediv_2RealDiv&cicada-v2/outputs/truediv_2/x:output:0cicada-v2/outputs/Cast:y:0*
T0*
_output_shapes
: ^
cicada-v2/outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/outputs/sub_3Sub"cicada-v2/outputs/sub_3/x:output:0cicada-v2/outputs/truediv_2:z:0*
T0*
_output_shapes
: �
'cicada-v2/outputs/clip_by_value/MinimumMinimumcicada-v2/outputs/truediv_1:z:0cicada-v2/outputs/sub_3:z:0*
T0*'
_output_shapes
:���������f
!cicada-v2/outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
cicada-v2/outputs/clip_by_valueMaximum+cicada-v2/outputs/clip_by_value/Minimum:z:0*cicada-v2/outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/mul_2Mulcicada-v2/outputs/Cast_1:y:0#cicada-v2/outputs/clip_by_value:z:0*
T0*'
_output_shapes
:���������u
cicada-v2/outputs/Neg_1Neg#cicada-v2/outputs/SelectV2:output:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/add_2AddV2cicada-v2/outputs/Neg_1:y:0cicada-v2/outputs/mul_2:z:0*
T0*'
_output_shapes
:���������^
cicada-v2/outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada-v2/outputs/mul_3Mul"cicada-v2/outputs/mul_3/x:output:0cicada-v2/outputs/add_2:z:0*
T0*'
_output_shapes
:���������
 cicada-v2/outputs/StopGradient_1StopGradientcicada-v2/outputs/mul_3:z:0*
T0*'
_output_shapes
:����������
cicada-v2/outputs/add_3AddV2#cicada-v2/outputs/SelectV2:output:0)cicada-v2/outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:���������j
IdentityIdentitycicada-v2/outputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^cicada-v2/conv/ReadVariableOp ^cicada-v2/conv/ReadVariableOp_1 ^cicada-v2/conv/ReadVariableOp_2%^cicada-v2/dense1/AssignAddVariableOp(^cicada-v2/dense1/BiasAdd/ReadVariableOp'^cicada-v2/dense1/MatMul/ReadVariableOp ^cicada-v2/dense1/ReadVariableOp"^cicada-v2/dense1/ReadVariableOp_1&^cicada-v2/dense1/add_2/ReadVariableOp@^cicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOpB^cicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_1B^cicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_2D^cicada-v2/dense1/batch_normalization_5/batchnorm/mul/ReadVariableOp$^cicada-v2/dense1/mul/ReadVariableOp&^cicada-v2/dense1/mul_1/ReadVariableOp&^cicada-v2/dense1/mul_3/ReadVariableOp$^cicada-v2/dense1/sub/ReadVariableOp ^cicada-v2/dense2/ReadVariableOp"^cicada-v2/dense2/ReadVariableOp_1"^cicada-v2/dense2/ReadVariableOp_2*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:����������: : : : : : : : : 2B
cicada-v2/conv/ReadVariableOp_1cicada-v2/conv/ReadVariableOp_12B
cicada-v2/conv/ReadVariableOp_2cicada-v2/conv/ReadVariableOp_22>
cicada-v2/conv/ReadVariableOpcicada-v2/conv/ReadVariableOp2L
$cicada-v2/dense1/AssignAddVariableOp$cicada-v2/dense1/AssignAddVariableOp2R
'cicada-v2/dense1/BiasAdd/ReadVariableOp'cicada-v2/dense1/BiasAdd/ReadVariableOp2P
&cicada-v2/dense1/MatMul/ReadVariableOp&cicada-v2/dense1/MatMul/ReadVariableOp2F
!cicada-v2/dense1/ReadVariableOp_1!cicada-v2/dense1/ReadVariableOp_12B
cicada-v2/dense1/ReadVariableOpcicada-v2/dense1/ReadVariableOp2N
%cicada-v2/dense1/add_2/ReadVariableOp%cicada-v2/dense1/add_2/ReadVariableOp2�
Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_1Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_12�
Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_2Acicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp_22�
?cicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp?cicada-v2/dense1/batch_normalization_5/batchnorm/ReadVariableOp2�
Ccicada-v2/dense1/batch_normalization_5/batchnorm/mul/ReadVariableOpCcicada-v2/dense1/batch_normalization_5/batchnorm/mul/ReadVariableOp2J
#cicada-v2/dense1/mul/ReadVariableOp#cicada-v2/dense1/mul/ReadVariableOp2N
%cicada-v2/dense1/mul_1/ReadVariableOp%cicada-v2/dense1/mul_1/ReadVariableOp2N
%cicada-v2/dense1/mul_3/ReadVariableOp%cicada-v2/dense1/mul_3/ReadVariableOp2J
#cicada-v2/dense1/sub/ReadVariableOp#cicada-v2/dense1/sub/ReadVariableOp2F
!cicada-v2/dense2/ReadVariableOp_1!cicada-v2/dense2/ReadVariableOp_12F
!cicada-v2/dense2/ReadVariableOp_2!cicada-v2/dense2/ReadVariableOp_22B
cicada-v2/dense2/ReadVariableOpcicada-v2/dense2/ReadVariableOp:(	$
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
resource:Q M
(
_output_shapes
:����������
!
_user_specified_name	inputs_
�
�
(__inference_dense1_layer_call_fn_1042905

inputs
unknown:	�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_1042513o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":����������: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:'#
!
_user_specified_name	1042901:'#
!
_user_specified_name	1042899:'#
!
_user_specified_name	1042897:'#
!
_user_specified_name	1042895:'#
!
_user_specified_name	1042893:'#
!
_user_specified_name	1042891:'#
!
_user_specified_name	1042889:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
C__inference_dense2_layer_call_and_return_conditional_losses_1042324

inputs)
readvariableop_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: f
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0T
mulMulReadVariableOp:value:0Pow:z:0*
T0*
_output_shapes

:O
truedivRealDivmul:z:0	Pow_1:z:0*
T0*
_output_shapes

:@
NegNegtruediv:z:0*
T0*
_output_shapes

:D
RoundRoundtruediv:z:0*
T0*
_output_shapes

:I
addAddV2Neg:y:0	Round:y:0*
T0*
_output_shapes

:N
StopGradientStopGradientadd:z:0*
T0*
_output_shapes

:[
add_1AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes

:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: ]
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*
_output_shapes

:g
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*
_output_shapes

:S
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes

:Q
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*
_output_shapes

:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*
_output_shapes

:h
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0O
Neg_2NegReadVariableOp_1:value:0*
T0*
_output_shapes

:M
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*
_output_shapes

:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?R
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*
_output_shapes

:R
StopGradient_1StopGradient	mul_4:z:0*
T0*
_output_shapes

:h
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0j
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes

:U
MatMulMatMulinputs	add_4:z:0*
T0*'
_output_shapes
:���������_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:���������Y
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�&
�
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043413

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identity��AssignMovingAvg�AssignMovingAvg/ReadVariableOp�AssignMovingAvg_1� AssignMovingAvg_1/ReadVariableOp�batchnorm/ReadVariableOp�batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:�
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:���������l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0�
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:�
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0�
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:�
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������: : : : 2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12"
AssignMovingAvgAssignMovingAvg24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:($
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
resource:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
C__inference_dense2_layer_call_and_return_conditional_losses_1043301

inputs)
readvariableop_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: f
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0T
mulMulReadVariableOp:value:0Pow:z:0*
T0*
_output_shapes

:O
truedivRealDivmul:z:0	Pow_1:z:0*
T0*
_output_shapes

:@
NegNegtruediv:z:0*
T0*
_output_shapes

:D
RoundRoundtruediv:z:0*
T0*
_output_shapes

:I
addAddV2Neg:y:0	Round:y:0*
T0*
_output_shapes

:N
StopGradientStopGradientadd:z:0*
T0*
_output_shapes

:[
add_1AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes

:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: ]
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*
_output_shapes

:g
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*
_output_shapes

:S
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes

:Q
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*
_output_shapes

:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*
_output_shapes

:h
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0O
Neg_2NegReadVariableOp_1:value:0*
T0*
_output_shapes

:M
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*
_output_shapes

:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?R
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*
_output_shapes

:R
StopGradient_1StopGradient	mul_4:z:0*
T0*
_output_shapes

:h
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0j
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes

:U
MatMulMatMulinputs	add_4:z:0*
T0*'
_output_shapes
:���������_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:���������Y
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�&
�
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1041885

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identity��AssignMovingAvg�AssignMovingAvg/ReadVariableOp�AssignMovingAvg_1� AssignMovingAvg_1/ReadVariableOp�batchnorm/ReadVariableOp�batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:�
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:���������l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0�
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:�
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0�
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:�
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������: : : : 2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12"
AssignMovingAvgAssignMovingAvg24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:($
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
resource:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
E
)__inference_flatten_layer_call_fn_1042834

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
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_1042046a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
e
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042867

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:����������\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
`
D__inference_reshape_layer_call_and_return_conditional_losses_1042729

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
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
|
(__inference_dense2_layer_call_fn_1043260

inputs
unknown:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_1042324o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 22
StatefulPartitionedCallStatefulPartitionedCall:'#
!
_user_specified_name	1043256:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
e
,__inference_dropout_10_layer_call_fn_1042845

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042059p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
`
D__inference_reshape_layer_call_and_return_conditional_losses_1041947

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
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

f
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043248

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I�?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:���������Q
dropout/ShapeShapeinputs*
T0*
_output_shapes
::���
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:���������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:���������T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    �
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
^
B__inference_relu1_layer_call_and_return_conditional_losses_1043226

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������O
	ones_likeOnesLikeinputs*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: V
mulMulones_like:y:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
`
D__inference_flatten_layer_call_and_return_conditional_losses_1042046

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043433

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identity��batchnorm/ReadVariableOp�batchnorm/ReadVariableOp_1�batchnorm/ReadVariableOp_2�batchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������: : : : 28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_224
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:($
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
resource:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
��
�
C__inference_dense1_layer_call_and_return_conditional_losses_1042207

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:K
=batch_normalization_5_assignmovingavg_readvariableop_resource:M
?batch_normalization_5_assignmovingavg_1_readvariableop_resource:I
;batch_normalization_5_batchnorm_mul_readvariableop_resource:E
7batch_normalization_5_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identity��AssignAddVariableOp�BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2�add_2/ReadVariableOp�%batch_normalization_5/AssignMovingAvg�4batch_normalization_5/AssignMovingAvg/ReadVariableOp�'batch_normalization_5/AssignMovingAvg_1�6batch_normalization_5/AssignMovingAvg_1/ReadVariableOp�.batch_normalization_5/batchnorm/ReadVariableOp�2batch_normalization_5/batchnorm/mul/ReadVariableOp�mul/ReadVariableOp�mul_1/ReadVariableOp�mul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������~
4batch_normalization_5/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
"batch_normalization_5/moments/meanMeanBiasAdd:output:0=batch_normalization_5/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(�
*batch_normalization_5/moments/StopGradientStopGradient+batch_normalization_5/moments/mean:output:0*
T0*
_output_shapes

:�
/batch_normalization_5/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:03batch_normalization_5/moments/StopGradient:output:0*
T0*'
_output_shapes
:����������
8batch_normalization_5/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
&batch_normalization_5/moments/varianceMean3batch_normalization_5/moments/SquaredDifference:z:0Abatch_normalization_5/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(�
%batch_normalization_5/moments/SqueezeSqueeze+batch_normalization_5/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
'batch_normalization_5/moments/Squeeze_1Squeeze/batch_normalization_5/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 p
+batch_normalization_5/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
4batch_normalization_5/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_5_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0�
)batch_normalization_5/AssignMovingAvg/subSub<batch_normalization_5/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_5/moments/Squeeze:output:0*
T0*
_output_shapes
:�
)batch_normalization_5/AssignMovingAvg/mulMul-batch_normalization_5/AssignMovingAvg/sub:z:04batch_normalization_5/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:�
%batch_normalization_5/AssignMovingAvgAssignSubVariableOp=batch_normalization_5_assignmovingavg_readvariableop_resource-batch_normalization_5/AssignMovingAvg/mul:z:05^batch_normalization_5/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0r
-batch_normalization_5/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
6batch_normalization_5/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0�
+batch_normalization_5/AssignMovingAvg_1/subSub>batch_normalization_5/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_5/moments/Squeeze_1:output:0*
T0*
_output_shapes
:�
+batch_normalization_5/AssignMovingAvg_1/mulMul/batch_normalization_5/AssignMovingAvg_1/sub:z:06batch_normalization_5/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:�
'batch_normalization_5/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource/batch_normalization_5/AssignMovingAvg_1/mul:z:07^batch_normalization_5/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0j
%batch_normalization_5/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
#batch_normalization_5/batchnorm/addAddV20batch_normalization_5/moments/Squeeze_1:output:0.batch_normalization_5/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_5/batchnorm/RsqrtRsqrt'batch_normalization_5/batchnorm/add:z:0*
T0*
_output_shapes
:�
2batch_normalization_5/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/mulMul)batch_normalization_5/batchnorm/Rsqrt:y:0:batch_normalization_5/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_5/batchnorm/mul:z:0*
T0*'
_output_shapes
:����������
%batch_normalization_5/batchnorm/mul_2Mul.batch_normalization_5/moments/Squeeze:output:0'batch_normalization_5/batchnorm/mul:z:0*
T0*
_output_shapes
:�
.batch_normalization_5/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/subSub6batch_normalization_5/batchnorm/ReadVariableOp:value:0)batch_normalization_5/batchnorm/mul_2:z:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/add_1AddV2)batch_normalization_5/batchnorm/mul_1:z:0'batch_normalization_5/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R{
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:�
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:���������l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
ReadVariableOpReadVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource(^batch_normalization_5/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:�
mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
mul_1/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0c
subSubReadVariableOp_1:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:E
mul_2Mul	mul_1:z:0sub:z:0*
T0*
_output_shapes
:�
add_2/ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	�J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	�R
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	�A
NegNegtruediv:z:0*
T0*
_output_shapes
:	�E
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	�L
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	�Q
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	�\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	�6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	�h
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	�T
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	�R
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	�L
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	�A
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	�N
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	�L
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	�S
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	�\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	�L
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:���������M
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:�
ReadVariableOp_2ReadVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource(^batch_normalization_5/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:a
add_14AddV2ReadVariableOp_2:value:0add_14/y:output:0*
T0*
_output_shapes
:=
SqrtSqrt
add_14:z:0*
T0*
_output_shapes
:M
add_15/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:c
add_15AddV2moments/Squeeze_1:output:0add_15/y:output:0*
T0*
_output_shapes
:A
Rsqrt_3Rsqrt
add_15:z:0*
T0*
_output_shapes
:I
mul_14MulSqrt:y:0Rsqrt_3:y:0*
T0*
_output_shapes
:_
Mul_15MulMatMul_1:product:0
mul_14:z:0*
T0*'
_output_shapes
:���������^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:���������a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp&^batch_normalization_5/AssignMovingAvg5^batch_normalization_5/AssignMovingAvg/ReadVariableOp(^batch_normalization_5/AssignMovingAvg_17^batch_normalization_5/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_5/batchnorm/ReadVariableOp3^batch_normalization_5/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":����������: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22 
ReadVariableOpReadVariableOp2,
add_2/ReadVariableOpadd_2/ReadVariableOp2l
4batch_normalization_5/AssignMovingAvg/ReadVariableOp4batch_normalization_5/AssignMovingAvg/ReadVariableOp2p
6batch_normalization_5/AssignMovingAvg_1/ReadVariableOp6batch_normalization_5/AssignMovingAvg_1/ReadVariableOp2R
'batch_normalization_5/AssignMovingAvg_1'batch_normalization_5/AssignMovingAvg_12N
%batch_normalization_5/AssignMovingAvg%batch_normalization_5/AssignMovingAvg2`
.batch_normalization_5/batchnorm/ReadVariableOp.batch_normalization_5/batchnorm/ReadVariableOp2h
2batch_normalization_5/batchnorm/mul/ReadVariableOp2batch_normalization_5/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:($
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
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�	
�
7__inference_batch_normalization_5_layer_call_fn_1043379

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *[
fVRT
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1041905o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:'#
!
_user_specified_name	1043375:'#
!
_user_specified_name	1043373:'#
!
_user_specified_name	1043371:'#
!
_user_specified_name	1043369:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
`
D__inference_outputs_layer_call_and_return_conditional_losses_1043353

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������O
	ones_likeOnesLikeinputs*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: V
mulMulones_like:y:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
`
D__inference_flatten_layer_call_and_return_conditional_losses_1042840

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
e
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043253

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:���������[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:���������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
+__inference_cicada-v2_layer_call_fn_1042564
inputs_!
unknown:
	unknown_0:	�
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042377o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:����������: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:'	#
!
_user_specified_name	1042560:'#
!
_user_specified_name	1042558:'#
!
_user_specified_name	1042556:'#
!
_user_specified_name	1042554:'#
!
_user_specified_name	1042552:'#
!
_user_specified_name	1042550:'#
!
_user_specified_name	1042548:'#
!
_user_specified_name	1042546:'#
!
_user_specified_name	1042544:Q M
(
_output_shapes
:����������
!
_user_specified_name	inputs_
��
�
C__inference_dense1_layer_call_and_return_conditional_losses_1043052

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:K
=batch_normalization_5_assignmovingavg_readvariableop_resource:M
?batch_normalization_5_assignmovingavg_1_readvariableop_resource:I
;batch_normalization_5_batchnorm_mul_readvariableop_resource:E
7batch_normalization_5_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identity��AssignAddVariableOp�BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2�add_2/ReadVariableOp�%batch_normalization_5/AssignMovingAvg�4batch_normalization_5/AssignMovingAvg/ReadVariableOp�'batch_normalization_5/AssignMovingAvg_1�6batch_normalization_5/AssignMovingAvg_1/ReadVariableOp�.batch_normalization_5/batchnorm/ReadVariableOp�2batch_normalization_5/batchnorm/mul/ReadVariableOp�mul/ReadVariableOp�mul_1/ReadVariableOp�mul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������~
4batch_normalization_5/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
"batch_normalization_5/moments/meanMeanBiasAdd:output:0=batch_normalization_5/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(�
*batch_normalization_5/moments/StopGradientStopGradient+batch_normalization_5/moments/mean:output:0*
T0*
_output_shapes

:�
/batch_normalization_5/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:03batch_normalization_5/moments/StopGradient:output:0*
T0*'
_output_shapes
:����������
8batch_normalization_5/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
&batch_normalization_5/moments/varianceMean3batch_normalization_5/moments/SquaredDifference:z:0Abatch_normalization_5/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(�
%batch_normalization_5/moments/SqueezeSqueeze+batch_normalization_5/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
'batch_normalization_5/moments/Squeeze_1Squeeze/batch_normalization_5/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 p
+batch_normalization_5/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
4batch_normalization_5/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_5_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0�
)batch_normalization_5/AssignMovingAvg/subSub<batch_normalization_5/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_5/moments/Squeeze:output:0*
T0*
_output_shapes
:�
)batch_normalization_5/AssignMovingAvg/mulMul-batch_normalization_5/AssignMovingAvg/sub:z:04batch_normalization_5/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:�
%batch_normalization_5/AssignMovingAvgAssignSubVariableOp=batch_normalization_5_assignmovingavg_readvariableop_resource-batch_normalization_5/AssignMovingAvg/mul:z:05^batch_normalization_5/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0r
-batch_normalization_5/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
6batch_normalization_5/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0�
+batch_normalization_5/AssignMovingAvg_1/subSub>batch_normalization_5/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_5/moments/Squeeze_1:output:0*
T0*
_output_shapes
:�
+batch_normalization_5/AssignMovingAvg_1/mulMul/batch_normalization_5/AssignMovingAvg_1/sub:z:06batch_normalization_5/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:�
'batch_normalization_5/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource/batch_normalization_5/AssignMovingAvg_1/mul:z:07^batch_normalization_5/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0j
%batch_normalization_5/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
#batch_normalization_5/batchnorm/addAddV20batch_normalization_5/moments/Squeeze_1:output:0.batch_normalization_5/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_5/batchnorm/RsqrtRsqrt'batch_normalization_5/batchnorm/add:z:0*
T0*
_output_shapes
:�
2batch_normalization_5/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/mulMul)batch_normalization_5/batchnorm/Rsqrt:y:0:batch_normalization_5/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_5/batchnorm/mul:z:0*
T0*'
_output_shapes
:����������
%batch_normalization_5/batchnorm/mul_2Mul.batch_normalization_5/moments/Squeeze:output:0'batch_normalization_5/batchnorm/mul:z:0*
T0*
_output_shapes
:�
.batch_normalization_5/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/subSub6batch_normalization_5/batchnorm/ReadVariableOp:value:0)batch_normalization_5/batchnorm/mul_2:z:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/add_1AddV2)batch_normalization_5/batchnorm/mul_1:z:0'batch_normalization_5/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R{
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:�
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:���������l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
ReadVariableOpReadVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource(^batch_normalization_5/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:�
mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
mul_1/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0c
subSubReadVariableOp_1:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:E
mul_2Mul	mul_1:z:0sub:z:0*
T0*
_output_shapes
:�
add_2/ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	�J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	�R
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	�A
NegNegtruediv:z:0*
T0*
_output_shapes
:	�E
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	�L
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	�Q
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	�\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	�6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	�h
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	�T
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	�R
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	�L
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	�A
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	�N
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	�L
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	�S
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	�\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	�L
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:���������M
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:�
ReadVariableOp_2ReadVariableOp?batch_normalization_5_assignmovingavg_1_readvariableop_resource(^batch_normalization_5/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:a
add_14AddV2ReadVariableOp_2:value:0add_14/y:output:0*
T0*
_output_shapes
:=
SqrtSqrt
add_14:z:0*
T0*
_output_shapes
:M
add_15/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:c
add_15AddV2moments/Squeeze_1:output:0add_15/y:output:0*
T0*
_output_shapes
:A
Rsqrt_3Rsqrt
add_15:z:0*
T0*
_output_shapes
:I
mul_14MulSqrt:y:0Rsqrt_3:y:0*
T0*
_output_shapes
:_
Mul_15MulMatMul_1:product:0
mul_14:z:0*
T0*'
_output_shapes
:���������^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:���������a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp&^batch_normalization_5/AssignMovingAvg5^batch_normalization_5/AssignMovingAvg/ReadVariableOp(^batch_normalization_5/AssignMovingAvg_17^batch_normalization_5/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_5/batchnorm/ReadVariableOp3^batch_normalization_5/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":����������: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22 
ReadVariableOpReadVariableOp2,
add_2/ReadVariableOpadd_2/ReadVariableOp2l
4batch_normalization_5/AssignMovingAvg/ReadVariableOp4batch_normalization_5/AssignMovingAvg/ReadVariableOp2p
6batch_normalization_5/AssignMovingAvg_1/ReadVariableOp6batch_normalization_5/AssignMovingAvg_1/ReadVariableOp2R
'batch_normalization_5/AssignMovingAvg_1'batch_normalization_5/AssignMovingAvg_12N
%batch_normalization_5/AssignMovingAvg%batch_normalization_5/AssignMovingAvg2`
.batch_normalization_5/batchnorm/ReadVariableOp.batch_normalization_5/batchnorm/ReadVariableOp2h
2batch_normalization_5/batchnorm/mul/ReadVariableOp2batch_normalization_5/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:($
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
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1041905

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identity��batchnorm/ReadVariableOp�batchnorm/ReadVariableOp_1�batchnorm/ReadVariableOp_2�batchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������: : : : 28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_224
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:($
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
resource:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
(__inference_dense1_layer_call_fn_1042886

inputs
unknown:	�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_1042207o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":����������: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:'#
!
_user_specified_name	1042882:'#
!
_user_specified_name	1042880:'#
!
_user_specified_name	1042878:'#
!
_user_specified_name	1042876:'#
!
_user_specified_name	1042874:'#
!
_user_specified_name	1042872:'#
!
_user_specified_name	1042870:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
+__inference_cicada-v2_layer_call_fn_1042587
inputs_!
unknown:
	unknown_0:	�
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042541o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:����������: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:'	#
!
_user_specified_name	1042583:'#
!
_user_specified_name	1042581:'#
!
_user_specified_name	1042579:'#
!
_user_specified_name	1042577:'#
!
_user_specified_name	1042575:'#
!
_user_specified_name	1042573:'#
!
_user_specified_name	1042571:'#
!
_user_specified_name	1042569:'#
!
_user_specified_name	1042567:Q M
(
_output_shapes
:����������
!
_user_specified_name	inputs_
�(
�
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042541
inputs_&
conv_1042381:!
dense1_1042514:	�
dense1_1042516:
dense1_1042518:
dense1_1042520:
dense1_1042522:
dense1_1042524:
dense1_1042526:	  
dense2_1042536:
identity��conv/StatefulPartitionedCall�dense1/StatefulPartitionedCall�dense2/StatefulPartitionedCall�
reshape/PartitionedCallPartitionedCallinputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_1041947�
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_1042381*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_1041989�
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_1042039�
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_1042046�
dropout_10/PartitionedCallPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042390�
dense1/StatefulPartitionedCallStatefulPartitionedCall#dropout_10/PartitionedCall:output:0dense1_1042514dense1_1042516dense1_1042518dense1_1042520dense1_1042522dense1_1042524dense1_1042526*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_1042513�
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_1042269�
dropout_11/PartitionedCallPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_11_layer_call_and_return_conditional_losses_1042534�
dense2/StatefulPartitionedCallStatefulPartitionedCall#dropout_11/PartitionedCall:output:0dense2_1042536*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_1042324�
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_1042374o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:����������: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall:'	#
!
_user_specified_name	1042536:'#
!
_user_specified_name	1042526:'#
!
_user_specified_name	1042524:'#
!
_user_specified_name	1042522:'#
!
_user_specified_name	1042520:'#
!
_user_specified_name	1042518:'#
!
_user_specified_name	1042516:'#
!
_user_specified_name	1042514:'#
!
_user_specified_name	1042381:Q M
(
_output_shapes
:����������
!
_user_specified_name	inputs_
�x
�
#__inference__traced_restore_1043689
file_prefix6
assignvariableop_conv_kernel:3
 assignvariableop_1_dense1_kernel:	�,
assignvariableop_2_dense1_bias:-
#assignvariableop_3_dense1_iteration:	 2
 assignvariableop_4_dense2_kernel:C
5assignvariableop_5_dense1_batch_normalization_5_gamma:B
4assignvariableop_6_dense1_batch_normalization_5_beta:I
;assignvariableop_7_dense1_batch_normalization_5_moving_mean:M
?assignvariableop_8_dense1_batch_normalization_5_moving_variance:&
assignvariableop_9_iteration:	 +
!assignvariableop_10_learning_rate: @
&assignvariableop_11_adam_m_conv_kernel:@
&assignvariableop_12_adam_v_conv_kernel:;
(assignvariableop_13_adam_m_dense1_kernel:	�;
(assignvariableop_14_adam_v_dense1_kernel:	�4
&assignvariableop_15_adam_m_dense1_bias:4
&assignvariableop_16_adam_v_dense1_bias:K
=assignvariableop_17_adam_m_dense1_batch_normalization_5_gamma:K
=assignvariableop_18_adam_v_dense1_batch_normalization_5_gamma:J
<assignvariableop_19_adam_m_dense1_batch_normalization_5_beta:J
<assignvariableop_20_adam_v_dense1_batch_normalization_5_beta::
(assignvariableop_21_adam_m_dense2_kernel::
(assignvariableop_22_adam_v_dense2_kernel:#
assignvariableop_23_total: #
assignvariableop_24_count: 
identity_26��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_3�AssignVariableOp_4�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�

value�
B�
B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*|
_output_shapesj
h::::::::::::::::::::::::::*(
dtypes
2		[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOpassignvariableop_conv_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp assignvariableop_1_dense1_kernelIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOpassignvariableop_2_dense1_biasIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp#assignvariableop_3_dense1_iterationIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp assignvariableop_4_dense2_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp5assignvariableop_5_dense1_batch_normalization_5_gammaIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp4assignvariableop_6_dense1_batch_normalization_5_betaIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp;assignvariableop_7_dense1_batch_normalization_5_moving_meanIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp?assignvariableop_8_dense1_batch_normalization_5_moving_varianceIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_9AssignVariableOpassignvariableop_9_iterationIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp!assignvariableop_10_learning_rateIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp&assignvariableop_11_adam_m_conv_kernelIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp&assignvariableop_12_adam_v_conv_kernelIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOp(assignvariableop_13_adam_m_dense1_kernelIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOp(assignvariableop_14_adam_v_dense1_kernelIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOp&assignvariableop_15_adam_m_dense1_biasIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOp&assignvariableop_16_adam_v_dense1_biasIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOp=assignvariableop_17_adam_m_dense1_batch_normalization_5_gammaIdentity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp=assignvariableop_18_adam_v_dense1_batch_normalization_5_gammaIdentity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOp<assignvariableop_19_adam_m_dense1_batch_normalization_5_betaIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOp<assignvariableop_20_adam_v_dense1_batch_normalization_5_betaIdentity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp(assignvariableop_21_adam_m_dense2_kernelIdentity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp(assignvariableop_22_adam_v_dense2_kernelIdentity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOpassignvariableop_23_totalIdentity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOpassignvariableop_24_countIdentity_24:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 �
Identity_25Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_26IdentityIdentity_25:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
_output_shapes
 "#
identity_26Identity_26:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4: : : : : : : : : : : : : : : : : : : : : : : : : : 2*
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
AssignVariableOp_24AssignVariableOp_242(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_92$
AssignVariableOpAssignVariableOp:%!

_user_specified_namecount:%!

_user_specified_nametotal:40
.
_user_specified_nameAdam/v/dense2/kernel:40
.
_user_specified_nameAdam/m/dense2/kernel:HD
B
_user_specified_name*(Adam/v/dense1/batch_normalization_5/beta:HD
B
_user_specified_name*(Adam/m/dense1/batch_normalization_5/beta:IE
C
_user_specified_name+)Adam/v/dense1/batch_normalization_5/gamma:IE
C
_user_specified_name+)Adam/m/dense1/batch_normalization_5/gamma:2.
,
_user_specified_nameAdam/v/dense1/bias:2.
,
_user_specified_nameAdam/m/dense1/bias:40
.
_user_specified_nameAdam/v/dense1/kernel:40
.
_user_specified_nameAdam/m/dense1/kernel:2.
,
_user_specified_nameAdam/v/conv/kernel:2.
,
_user_specified_nameAdam/m/conv/kernel:-)
'
_user_specified_namelearning_rate:)
%
#
_user_specified_name	iteration:L	H
F
_user_specified_name.,dense1/batch_normalization_5/moving_variance:HD
B
_user_specified_name*(dense1/batch_normalization_5/moving_mean:A=
;
_user_specified_name#!dense1/batch_normalization_5/beta:B>
<
_user_specified_name$"dense1/batch_normalization_5/gamma:-)
'
_user_specified_namedense2/kernel:0,
*
_user_specified_namedense1/iteration:+'
%
_user_specified_namedense1/bias:-)
'
_user_specified_namedense1/kernel:+'
%
_user_specified_nameconv/kernel:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
H
,__inference_dropout_10_layer_call_fn_1042850

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
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042390a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
e
,__inference_dropout_11_layer_call_fn_1043231

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_11_layer_call_and_return_conditional_losses_1042282o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
E
)__inference_reshape_layer_call_fn_1042715

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
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_1041947h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
C
'__inference_relu1_layer_call_fn_1043179

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_1042269`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�l
�
C__inference_dense1_layer_call_and_return_conditional_losses_1043174

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:E
7batch_normalization_5_batchnorm_readvariableop_resource:I
;batch_normalization_5_batchnorm_mul_readvariableop_resource:G
9batch_normalization_5_batchnorm_readvariableop_1_resource:G
9batch_normalization_5_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identity��AssignAddVariableOp�BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�ReadVariableOp�ReadVariableOp_1�add_2/ReadVariableOp�.batch_normalization_5/batchnorm/ReadVariableOp�0batch_normalization_5/batchnorm/ReadVariableOp_1�0batch_normalization_5/batchnorm/ReadVariableOp_2�2batch_normalization_5/batchnorm/mul/ReadVariableOp�mul/ReadVariableOp�mul_1/ReadVariableOp�mul_3/ReadVariableOp�sub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.batch_normalization_5/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0j
%batch_normalization_5/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
#batch_normalization_5/batchnorm/addAddV26batch_normalization_5/batchnorm/ReadVariableOp:value:0.batch_normalization_5/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_5/batchnorm/RsqrtRsqrt'batch_normalization_5/batchnorm/add:z:0*
T0*
_output_shapes
:�
2batch_normalization_5/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/mulMul)batch_normalization_5/batchnorm/Rsqrt:y:0:batch_normalization_5/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_5/batchnorm/mul:z:0*
T0*'
_output_shapes
:����������
0batch_normalization_5/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_5_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0�
%batch_normalization_5/batchnorm/mul_2Mul8batch_normalization_5/batchnorm/ReadVariableOp_1:value:0'batch_normalization_5/batchnorm/mul:z:0*
T0*
_output_shapes
:�
0batch_normalization_5/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_5_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/subSub8batch_normalization_5/batchnorm/ReadVariableOp_2:value:0)batch_normalization_5/batchnorm/mul_2:z:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/add_1AddV2)batch_normalization_5/batchnorm/mul_1:z:0'batch_normalization_5/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R {
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:�
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:���������l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:�
mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
mul_1/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
sub/ReadVariableOpReadVariableOp9batch_normalization_5_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0e
subSubReadVariableOp_1:value:0sub/ReadVariableOp:value:0*
T0*
_output_shapes
:C
mul_2Mulmul:z:0sub:z:0*
T0*
_output_shapes
:�
add_2/ReadVariableOpReadVariableOp9batch_normalization_5_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	�J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	�R
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	�A
NegNegtruediv:z:0*
T0*
_output_shapes
:	�E
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	�L
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	�Q
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	�\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	�6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	�h
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	�T
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	�R
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	�L
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	�A
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	�N
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	�L
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	�S
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	�\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	�L
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:���������f
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:���������a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp/^batch_normalization_5/batchnorm/ReadVariableOp1^batch_normalization_5/batchnorm/ReadVariableOp_11^batch_normalization_5/batchnorm/ReadVariableOp_23^batch_normalization_5/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":����������: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12 
ReadVariableOpReadVariableOp2,
add_2/ReadVariableOpadd_2/ReadVariableOp2d
0batch_normalization_5/batchnorm/ReadVariableOp_10batch_normalization_5/batchnorm/ReadVariableOp_12d
0batch_normalization_5/batchnorm/ReadVariableOp_20batch_normalization_5/batchnorm/ReadVariableOp_22`
.batch_normalization_5/batchnorm/ReadVariableOp.batch_normalization_5/batchnorm/ReadVariableOp2h
2batch_normalization_5/batchnorm/mul/ReadVariableOp2batch_normalization_5/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:($
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
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
� 
^
B__inference_relu0_layer_call_and_return_conditional_losses_1042039

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*/
_output_shapes
:���������	N
ReluReluinputs*
T0*/
_output_shapes
:���������	W
	ones_likeOnesLikeinputs*
T0*/
_output_shapes
:���������	D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: ^
mulMulones_like:y:0	sub_2:z:0*
T0*/
_output_shapes
:���������	z
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*/
_output_shapes
:���������	X
mul_1MulinputsCast:y:0*
T0*/
_output_shapes
:���������	c
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*/
_output_shapes
:���������	Q
NegNegtruediv:z:0*
T0*/
_output_shapes
:���������	U
RoundRoundtruediv:z:0*
T0*/
_output_shapes
:���������	Z
addAddV2Neg:y:0	Round:y:0*
T0*/
_output_shapes
:���������	_
StopGradientStopGradientadd:z:0*
T0*/
_output_shapes
:���������	l
add_1AddV2truediv:z:0StopGradient:output:0*
T0*/
_output_shapes
:���������	c
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*/
_output_shapes
:���������	P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: t
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*/
_output_shapes
:���������	T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*/
_output_shapes
:���������	e
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*/
_output_shapes
:���������	Y
Neg_1NegSelectV2:output:0*
T0*/
_output_shapes
:���������	^
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*/
_output_shapes
:���������	L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?c
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*/
_output_shapes
:���������	c
StopGradient_1StopGradient	mul_3:z:0*
T0*/
_output_shapes
:���������	t
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������	Y
IdentityIdentity	add_3:z:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
`
D__inference_outputs_layer_call_and_return_conditional_losses_1042374

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������O
	ones_likeOnesLikeinputs*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: V
mulMulones_like:y:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

f
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042059

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������Q
dropout/ShapeShapeinputs*
T0*
_output_shapes
::���
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9��=�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    �
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*(
_output_shapes
:����������b
IdentityIdentitydropout/SelectV2:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
A__inference_conv_layer_call_and_return_conditional_losses_1042777

inputs1
readvariableop_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: n
ReadVariableOpReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0\
mulMulReadVariableOp:value:0Pow:z:0*
T0*&
_output_shapes
:W
truedivRealDivmul:z:0	Pow_1:z:0*
T0*&
_output_shapes
:H
NegNegtruediv:z:0*
T0*&
_output_shapes
:L
RoundRoundtruediv:z:0*
T0*&
_output_shapes
:Q
addAddV2Neg:y:0	Round:y:0*
T0*&
_output_shapes
:V
StopGradientStopGradientadd:z:0*
T0*&
_output_shapes
:c
add_1AddV2truediv:z:0StopGradient:output:0*
T0*&
_output_shapes
:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: e
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*&
_output_shapes
:o
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*&
_output_shapes
:[
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*&
_output_shapes
:Y
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*&
_output_shapes
:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?^
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_1ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0W
Neg_2NegReadVariableOp_1:value:0*
T0*&
_output_shapes
:U
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*&
_output_shapes
:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Z
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*&
_output_shapes
:Z
StopGradient_1StopGradient	mul_4:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_2ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0r
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*&
_output_shapes
:�
convolutionConv2Dinputs	add_4:z:0*
T0*/
_output_shapes
:���������	*
paddingVALID*
strides
k
IdentityIdentityconvolution:output:0^NoOp*
T0*/
_output_shapes
:���������	Y
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: 2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
^
B__inference_relu1_layer_call_and_return_conditional_losses_1042269

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������O
	ones_likeOnesLikeinputs*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: V
mulMulones_like:y:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

f
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042862

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������Q
dropout/ShapeShapeinputs*
T0*
_output_shapes
::���
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9��=�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    �
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*(
_output_shapes
:����������b
IdentityIdentitydropout/SelectV2:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
��
�
 __inference__traced_save_1043605
file_prefix<
"read_disablecopyonread_conv_kernel:9
&read_1_disablecopyonread_dense1_kernel:	�2
$read_2_disablecopyonread_dense1_bias:3
)read_3_disablecopyonread_dense1_iteration:	 8
&read_4_disablecopyonread_dense2_kernel:I
;read_5_disablecopyonread_dense1_batch_normalization_5_gamma:H
:read_6_disablecopyonread_dense1_batch_normalization_5_beta:O
Aread_7_disablecopyonread_dense1_batch_normalization_5_moving_mean:S
Eread_8_disablecopyonread_dense1_batch_normalization_5_moving_variance:,
"read_9_disablecopyonread_iteration:	 1
'read_10_disablecopyonread_learning_rate: F
,read_11_disablecopyonread_adam_m_conv_kernel:F
,read_12_disablecopyonread_adam_v_conv_kernel:A
.read_13_disablecopyonread_adam_m_dense1_kernel:	�A
.read_14_disablecopyonread_adam_v_dense1_kernel:	�:
,read_15_disablecopyonread_adam_m_dense1_bias::
,read_16_disablecopyonread_adam_v_dense1_bias:Q
Cread_17_disablecopyonread_adam_m_dense1_batch_normalization_5_gamma:Q
Cread_18_disablecopyonread_adam_v_dense1_batch_normalization_5_gamma:P
Bread_19_disablecopyonread_adam_m_dense1_batch_normalization_5_beta:P
Bread_20_disablecopyonread_adam_v_dense1_batch_normalization_5_beta:@
.read_21_disablecopyonread_adam_m_dense2_kernel:@
.read_22_disablecopyonread_adam_v_dense2_kernel:)
read_23_disablecopyonread_total: )
read_24_disablecopyonread_count: 
savev2_const
identity_51��MergeV2Checkpoints�Read/DisableCopyOnRead�Read/ReadVariableOp�Read_1/DisableCopyOnRead�Read_1/ReadVariableOp�Read_10/DisableCopyOnRead�Read_10/ReadVariableOp�Read_11/DisableCopyOnRead�Read_11/ReadVariableOp�Read_12/DisableCopyOnRead�Read_12/ReadVariableOp�Read_13/DisableCopyOnRead�Read_13/ReadVariableOp�Read_14/DisableCopyOnRead�Read_14/ReadVariableOp�Read_15/DisableCopyOnRead�Read_15/ReadVariableOp�Read_16/DisableCopyOnRead�Read_16/ReadVariableOp�Read_17/DisableCopyOnRead�Read_17/ReadVariableOp�Read_18/DisableCopyOnRead�Read_18/ReadVariableOp�Read_19/DisableCopyOnRead�Read_19/ReadVariableOp�Read_2/DisableCopyOnRead�Read_2/ReadVariableOp�Read_20/DisableCopyOnRead�Read_20/ReadVariableOp�Read_21/DisableCopyOnRead�Read_21/ReadVariableOp�Read_22/DisableCopyOnRead�Read_22/ReadVariableOp�Read_23/DisableCopyOnRead�Read_23/ReadVariableOp�Read_24/DisableCopyOnRead�Read_24/ReadVariableOp�Read_3/DisableCopyOnRead�Read_3/ReadVariableOp�Read_4/DisableCopyOnRead�Read_4/ReadVariableOp�Read_5/DisableCopyOnRead�Read_5/ReadVariableOp�Read_6/DisableCopyOnRead�Read_6/ReadVariableOp�Read_7/DisableCopyOnRead�Read_7/ReadVariableOp�Read_8/DisableCopyOnRead�Read_8/ReadVariableOp�Read_9/DisableCopyOnRead�Read_9/ReadVariableOpw
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
: t
Read/DisableCopyOnReadDisableCopyOnRead"read_disablecopyonread_conv_kernel"/device:CPU:0*
_output_shapes
 �
Read/ReadVariableOpReadVariableOp"read_disablecopyonread_conv_kernel^Read/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0q
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:i

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*&
_output_shapes
:z
Read_1/DisableCopyOnReadDisableCopyOnRead&read_1_disablecopyonread_dense1_kernel"/device:CPU:0*
_output_shapes
 �
Read_1/ReadVariableOpReadVariableOp&read_1_disablecopyonread_dense1_kernel^Read_1/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0n

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�d

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes
:	�x
Read_2/DisableCopyOnReadDisableCopyOnRead$read_2_disablecopyonread_dense1_bias"/device:CPU:0*
_output_shapes
 �
Read_2/ReadVariableOpReadVariableOp$read_2_disablecopyonread_dense1_bias^Read_2/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0i

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:_

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*
_output_shapes
:}
Read_3/DisableCopyOnReadDisableCopyOnRead)read_3_disablecopyonread_dense1_iteration"/device:CPU:0*
_output_shapes
 �
Read_3/ReadVariableOpReadVariableOp)read_3_disablecopyonread_dense1_iteration^Read_3/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	e

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: [

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0	*
_output_shapes
: z
Read_4/DisableCopyOnReadDisableCopyOnRead&read_4_disablecopyonread_dense2_kernel"/device:CPU:0*
_output_shapes
 �
Read_4/ReadVariableOpReadVariableOp&read_4_disablecopyonread_dense2_kernel^Read_4/DisableCopyOnRead"/device:CPU:0*
_output_shapes

:*
dtype0m

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes

:c

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*
_output_shapes

:�
Read_5/DisableCopyOnReadDisableCopyOnRead;read_5_disablecopyonread_dense1_batch_normalization_5_gamma"/device:CPU:0*
_output_shapes
 �
Read_5/ReadVariableOpReadVariableOp;read_5_disablecopyonread_dense1_batch_normalization_5_gamma^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0j
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_6/DisableCopyOnReadDisableCopyOnRead:read_6_disablecopyonread_dense1_batch_normalization_5_beta"/device:CPU:0*
_output_shapes
 �
Read_6/ReadVariableOpReadVariableOp:read_6_disablecopyonread_dense1_batch_normalization_5_beta^Read_6/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0j
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_7/DisableCopyOnReadDisableCopyOnReadAread_7_disablecopyonread_dense1_batch_normalization_5_moving_mean"/device:CPU:0*
_output_shapes
 �
Read_7/ReadVariableOpReadVariableOpAread_7_disablecopyonread_dense1_batch_normalization_5_moving_mean^Read_7/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0j
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_8/DisableCopyOnReadDisableCopyOnReadEread_8_disablecopyonread_dense1_batch_normalization_5_moving_variance"/device:CPU:0*
_output_shapes
 �
Read_8/ReadVariableOpReadVariableOpEread_8_disablecopyonread_dense1_batch_normalization_5_moving_variance^Read_8/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0j
Identity_16IdentityRead_8/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0*
_output_shapes
:v
Read_9/DisableCopyOnReadDisableCopyOnRead"read_9_disablecopyonread_iteration"/device:CPU:0*
_output_shapes
 �
Read_9/ReadVariableOpReadVariableOp"read_9_disablecopyonread_iteration^Read_9/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	f
Identity_18IdentityRead_9/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: ]
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0	*
_output_shapes
: |
Read_10/DisableCopyOnReadDisableCopyOnRead'read_10_disablecopyonread_learning_rate"/device:CPU:0*
_output_shapes
 �
Read_10/ReadVariableOpReadVariableOp'read_10_disablecopyonread_learning_rate^Read_10/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_20IdentityRead_10/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_11/DisableCopyOnReadDisableCopyOnRead,read_11_disablecopyonread_adam_m_conv_kernel"/device:CPU:0*
_output_shapes
 �
Read_11/ReadVariableOpReadVariableOp,read_11_disablecopyonread_adam_m_conv_kernel^Read_11/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_22IdentityRead_11/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_12/DisableCopyOnReadDisableCopyOnRead,read_12_disablecopyonread_adam_v_conv_kernel"/device:CPU:0*
_output_shapes
 �
Read_12/ReadVariableOpReadVariableOp,read_12_disablecopyonread_adam_v_conv_kernel^Read_12/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_24IdentityRead_12/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*&
_output_shapes
:�
Read_13/DisableCopyOnReadDisableCopyOnRead.read_13_disablecopyonread_adam_m_dense1_kernel"/device:CPU:0*
_output_shapes
 �
Read_13/ReadVariableOpReadVariableOp.read_13_disablecopyonread_adam_m_dense1_kernel^Read_13/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0p
Identity_26IdentityRead_13/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�f
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_14/DisableCopyOnReadDisableCopyOnRead.read_14_disablecopyonread_adam_v_dense1_kernel"/device:CPU:0*
_output_shapes
 �
Read_14/ReadVariableOpReadVariableOp.read_14_disablecopyonread_adam_v_dense1_kernel^Read_14/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0p
Identity_28IdentityRead_14/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�f
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_15/DisableCopyOnReadDisableCopyOnRead,read_15_disablecopyonread_adam_m_dense1_bias"/device:CPU:0*
_output_shapes
 �
Read_15/ReadVariableOpReadVariableOp,read_15_disablecopyonread_adam_m_dense1_bias^Read_15/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_30IdentityRead_15/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_16/DisableCopyOnReadDisableCopyOnRead,read_16_disablecopyonread_adam_v_dense1_bias"/device:CPU:0*
_output_shapes
 �
Read_16/ReadVariableOpReadVariableOp,read_16_disablecopyonread_adam_v_dense1_bias^Read_16/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_32IdentityRead_16/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_33IdentityIdentity_32:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_17/DisableCopyOnReadDisableCopyOnReadCread_17_disablecopyonread_adam_m_dense1_batch_normalization_5_gamma"/device:CPU:0*
_output_shapes
 �
Read_17/ReadVariableOpReadVariableOpCread_17_disablecopyonread_adam_m_dense1_batch_normalization_5_gamma^Read_17/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_34IdentityRead_17/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_35IdentityIdentity_34:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_18/DisableCopyOnReadDisableCopyOnReadCread_18_disablecopyonread_adam_v_dense1_batch_normalization_5_gamma"/device:CPU:0*
_output_shapes
 �
Read_18/ReadVariableOpReadVariableOpCread_18_disablecopyonread_adam_v_dense1_batch_normalization_5_gamma^Read_18/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_36IdentityRead_18/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_37IdentityIdentity_36:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_19/DisableCopyOnReadDisableCopyOnReadBread_19_disablecopyonread_adam_m_dense1_batch_normalization_5_beta"/device:CPU:0*
_output_shapes
 �
Read_19/ReadVariableOpReadVariableOpBread_19_disablecopyonread_adam_m_dense1_batch_normalization_5_beta^Read_19/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_38IdentityRead_19/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_39IdentityIdentity_38:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_20/DisableCopyOnReadDisableCopyOnReadBread_20_disablecopyonread_adam_v_dense1_batch_normalization_5_beta"/device:CPU:0*
_output_shapes
 �
Read_20/ReadVariableOpReadVariableOpBread_20_disablecopyonread_adam_v_dense1_batch_normalization_5_beta^Read_20/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_40IdentityRead_20/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_41IdentityIdentity_40:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_21/DisableCopyOnReadDisableCopyOnRead.read_21_disablecopyonread_adam_m_dense2_kernel"/device:CPU:0*
_output_shapes
 �
Read_21/ReadVariableOpReadVariableOp.read_21_disablecopyonread_adam_m_dense2_kernel^Read_21/DisableCopyOnRead"/device:CPU:0*
_output_shapes

:*
dtype0o
Identity_42IdentityRead_21/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes

:e
Identity_43IdentityIdentity_42:output:0"/device:CPU:0*
T0*
_output_shapes

:�
Read_22/DisableCopyOnReadDisableCopyOnRead.read_22_disablecopyonread_adam_v_dense2_kernel"/device:CPU:0*
_output_shapes
 �
Read_22/ReadVariableOpReadVariableOp.read_22_disablecopyonread_adam_v_dense2_kernel^Read_22/DisableCopyOnRead"/device:CPU:0*
_output_shapes

:*
dtype0o
Identity_44IdentityRead_22/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes

:e
Identity_45IdentityIdentity_44:output:0"/device:CPU:0*
T0*
_output_shapes

:t
Read_23/DisableCopyOnReadDisableCopyOnReadread_23_disablecopyonread_total"/device:CPU:0*
_output_shapes
 �
Read_23/ReadVariableOpReadVariableOpread_23_disablecopyonread_total^Read_23/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_46IdentityRead_23/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_47IdentityIdentity_46:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_24/DisableCopyOnReadDisableCopyOnReadread_24_disablecopyonread_count"/device:CPU:0*
_output_shapes
 �
Read_24/ReadVariableOpReadVariableOpread_24_disablecopyonread_count^Read_24/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_48IdentityRead_24/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_49IdentityIdentity_48:output:0"/device:CPU:0*
T0*
_output_shapes
: �

SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�

value�
B�
B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0Identity_49:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *(
dtypes
2		�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 i
Identity_50Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: U
Identity_51IdentityIdentity_50:output:0^NoOp*
T0*
_output_shapes
: �

NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_16/DisableCopyOnRead^Read_16/ReadVariableOp^Read_17/DisableCopyOnRead^Read_17/ReadVariableOp^Read_18/DisableCopyOnRead^Read_18/ReadVariableOp^Read_19/DisableCopyOnRead^Read_19/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_20/DisableCopyOnRead^Read_20/ReadVariableOp^Read_21/DisableCopyOnRead^Read_21/ReadVariableOp^Read_22/DisableCopyOnRead^Read_22/ReadVariableOp^Read_23/DisableCopyOnRead^Read_23/ReadVariableOp^Read_24/DisableCopyOnRead^Read_24/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp*
_output_shapes
 "#
identity_51Identity_51:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6: : : : : : : : : : : : : : : : : : : : : : : : : : : 2(
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
Read_24/ReadVariableOpRead_24/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp24
Read_8/DisableCopyOnReadRead_8/DisableCopyOnRead2.
Read_8/ReadVariableOpRead_8/ReadVariableOp24
Read_9/DisableCopyOnReadRead_9/DisableCopyOnRead2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:=9

_output_shapes
: 

_user_specified_nameConst:%!

_user_specified_namecount:%!

_user_specified_nametotal:40
.
_user_specified_nameAdam/v/dense2/kernel:40
.
_user_specified_nameAdam/m/dense2/kernel:HD
B
_user_specified_name*(Adam/v/dense1/batch_normalization_5/beta:HD
B
_user_specified_name*(Adam/m/dense1/batch_normalization_5/beta:IE
C
_user_specified_name+)Adam/v/dense1/batch_normalization_5/gamma:IE
C
_user_specified_name+)Adam/m/dense1/batch_normalization_5/gamma:2.
,
_user_specified_nameAdam/v/dense1/bias:2.
,
_user_specified_nameAdam/m/dense1/bias:40
.
_user_specified_nameAdam/v/dense1/kernel:40
.
_user_specified_nameAdam/m/dense1/kernel:2.
,
_user_specified_nameAdam/v/conv/kernel:2.
,
_user_specified_nameAdam/m/conv/kernel:-)
'
_user_specified_namelearning_rate:)
%
#
_user_specified_name	iteration:L	H
F
_user_specified_name.,dense1/batch_normalization_5/moving_variance:HD
B
_user_specified_name*(dense1/batch_normalization_5/moving_mean:A=
;
_user_specified_name#!dense1/batch_normalization_5/beta:B>
<
_user_specified_name$"dense1/batch_normalization_5/gamma:-)
'
_user_specified_namedense2/kernel:0,
*
_user_specified_namedense1/iteration:+'
%
_user_specified_namedense1/bias:-)
'
_user_specified_namedense1/kernel:+'
%
_user_specified_nameconv/kernel:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
H
,__inference_dropout_11_layer_call_fn_1043236

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_11_layer_call_and_return_conditional_losses_1042534`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
&__inference_conv_layer_call_fn_1042736

inputs!
unknown:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_1041989w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: 22
StatefulPartitionedCallStatefulPartitionedCall:'#
!
_user_specified_name	1042732:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
C
'__inference_relu0_layer_call_fn_1042782

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
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_1042039h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
E
)__inference_outputs_layer_call_fn_1043306

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_1042374`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
%__inference_signature_wrapper_1042710
inputs_!
unknown:
	unknown_0:	�
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8� *+
f&R$
"__inference__wrapped_model_1041851o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:����������: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:'	#
!
_user_specified_name	1042706:'#
!
_user_specified_name	1042704:'#
!
_user_specified_name	1042702:'#
!
_user_specified_name	1042700:'#
!
_user_specified_name	1042698:'#
!
_user_specified_name	1042696:'#
!
_user_specified_name	1042694:'#
!
_user_specified_name	1042692:'#
!
_user_specified_name	1042690:Q M
(
_output_shapes
:����������
!
_user_specified_name	inputs_
�
e
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042390

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:����������\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
� 
^
B__inference_relu0_layer_call_and_return_conditional_losses_1042829

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*/
_output_shapes
:���������	N
ReluReluinputs*
T0*/
_output_shapes
:���������	W
	ones_likeOnesLikeinputs*
T0*/
_output_shapes
:���������	D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: ^
mulMulones_like:y:0	sub_2:z:0*
T0*/
_output_shapes
:���������	z
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*/
_output_shapes
:���������	X
mul_1MulinputsCast:y:0*
T0*/
_output_shapes
:���������	c
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*/
_output_shapes
:���������	Q
NegNegtruediv:z:0*
T0*/
_output_shapes
:���������	U
RoundRoundtruediv:z:0*
T0*/
_output_shapes
:���������	Z
addAddV2Neg:y:0	Round:y:0*
T0*/
_output_shapes
:���������	_
StopGradientStopGradientadd:z:0*
T0*/
_output_shapes
:���������	l
add_1AddV2truediv:z:0StopGradient:output:0*
T0*/
_output_shapes
:���������	c
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*/
_output_shapes
:���������	P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: t
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*/
_output_shapes
:���������	T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*/
_output_shapes
:���������	e
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*/
_output_shapes
:���������	Y
Neg_1NegSelectV2:output:0*
T0*/
_output_shapes
:���������	^
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*/
_output_shapes
:���������	L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?c
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*/
_output_shapes
:���������	c
StopGradient_1StopGradient	mul_3:z:0*
T0*/
_output_shapes
:���������	t
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������	Y
IdentityIdentity	add_3:z:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
A__inference_conv_layer_call_and_return_conditional_losses_1041989

inputs1
readvariableop_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: n
ReadVariableOpReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0\
mulMulReadVariableOp:value:0Pow:z:0*
T0*&
_output_shapes
:W
truedivRealDivmul:z:0	Pow_1:z:0*
T0*&
_output_shapes
:H
NegNegtruediv:z:0*
T0*&
_output_shapes
:L
RoundRoundtruediv:z:0*
T0*&
_output_shapes
:Q
addAddV2Neg:y:0	Round:y:0*
T0*&
_output_shapes
:V
StopGradientStopGradientadd:z:0*
T0*&
_output_shapes
:c
add_1AddV2truediv:z:0StopGradient:output:0*
T0*&
_output_shapes
:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: e
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*&
_output_shapes
:o
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*&
_output_shapes
:[
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*&
_output_shapes
:Y
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*&
_output_shapes
:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?^
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_1ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0W
Neg_2NegReadVariableOp_1:value:0*
T0*&
_output_shapes
:U
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*&
_output_shapes
:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Z
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*&
_output_shapes
:Z
StopGradient_1StopGradient	mul_4:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_2ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0r
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*&
_output_shapes
:�
convolutionConv2Dinputs	add_4:z:0*
T0*/
_output_shapes
:���������	*
paddingVALID*
strides
k
IdentityIdentityconvolution:output:0^NoOp*
T0*/
_output_shapes
:���������	Y
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: 2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
7__inference_batch_normalization_5_layer_call_fn_1043366

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *[
fVRT
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1041885o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:'#
!
_user_specified_name	1043362:'#
!
_user_specified_name	1043360:'#
!
_user_specified_name	1043358:'#
!
_user_specified_name	1043356:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�+
�
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042377
inputs_&
conv_1041990:!
dense1_1042208:	�
dense1_1042210:
dense1_1042212:
dense1_1042214:
dense1_1042216:
dense1_1042218:
dense1_1042220:	  
dense2_1042325:
identity��conv/StatefulPartitionedCall�dense1/StatefulPartitionedCall�dense2/StatefulPartitionedCall�"dropout_10/StatefulPartitionedCall�"dropout_11/StatefulPartitionedCall�
reshape/PartitionedCallPartitionedCallinputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_1041947�
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_1041990*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_1041989�
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_1042039�
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_1042046�
"dropout_10/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042059�
dense1/StatefulPartitionedCallStatefulPartitionedCall+dropout_10/StatefulPartitionedCall:output:0dense1_1042208dense1_1042210dense1_1042212dense1_1042214dense1_1042216dense1_1042218dense1_1042220*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_1042207�
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_1042269�
"dropout_11/StatefulPartitionedCallStatefulPartitionedCallrelu1/PartitionedCall:output:0#^dropout_10/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_dropout_11_layer_call_and_return_conditional_losses_1042282�
dense2/StatefulPartitionedCallStatefulPartitionedCall+dropout_11/StatefulPartitionedCall:output:0dense2_1042325*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_1042324�
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_1042374o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall#^dropout_10/StatefulPartitionedCall#^dropout_11/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:����������: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall2H
"dropout_10/StatefulPartitionedCall"dropout_10/StatefulPartitionedCall2H
"dropout_11/StatefulPartitionedCall"dropout_11/StatefulPartitionedCall:'	#
!
_user_specified_name	1042325:'#
!
_user_specified_name	1042220:'#
!
_user_specified_name	1042218:'#
!
_user_specified_name	1042216:'#
!
_user_specified_name	1042214:'#
!
_user_specified_name	1042212:'#
!
_user_specified_name	1042210:'#
!
_user_specified_name	1042208:'#
!
_user_specified_name	1041990:Q M
(
_output_shapes
:����������
!
_user_specified_name	inputs_
�
e
G__inference_dropout_11_layer_call_and_return_conditional_losses_1042534

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:���������[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:���������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�l
�
C__inference_dense1_layer_call_and_return_conditional_losses_1042513

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:E
7batch_normalization_5_batchnorm_readvariableop_resource:I
;batch_normalization_5_batchnorm_mul_readvariableop_resource:G
9batch_normalization_5_batchnorm_readvariableop_1_resource:G
9batch_normalization_5_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identity��AssignAddVariableOp�BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�ReadVariableOp�ReadVariableOp_1�add_2/ReadVariableOp�.batch_normalization_5/batchnorm/ReadVariableOp�0batch_normalization_5/batchnorm/ReadVariableOp_1�0batch_normalization_5/batchnorm/ReadVariableOp_2�2batch_normalization_5/batchnorm/mul/ReadVariableOp�mul/ReadVariableOp�mul_1/ReadVariableOp�mul_3/ReadVariableOp�sub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.batch_normalization_5/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0j
%batch_normalization_5/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
#batch_normalization_5/batchnorm/addAddV26batch_normalization_5/batchnorm/ReadVariableOp:value:0.batch_normalization_5/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_5/batchnorm/RsqrtRsqrt'batch_normalization_5/batchnorm/add:z:0*
T0*
_output_shapes
:�
2batch_normalization_5/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/mulMul)batch_normalization_5/batchnorm/Rsqrt:y:0:batch_normalization_5/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_5/batchnorm/mul:z:0*
T0*'
_output_shapes
:����������
0batch_normalization_5/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_5_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0�
%batch_normalization_5/batchnorm/mul_2Mul8batch_normalization_5/batchnorm/ReadVariableOp_1:value:0'batch_normalization_5/batchnorm/mul:z:0*
T0*
_output_shapes
:�
0batch_normalization_5/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_5_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0�
#batch_normalization_5/batchnorm/subSub8batch_normalization_5/batchnorm/ReadVariableOp_2:value:0)batch_normalization_5/batchnorm/mul_2:z:0*
T0*
_output_shapes
:�
%batch_normalization_5/batchnorm/add_1AddV2)batch_normalization_5/batchnorm/mul_1:z:0'batch_normalization_5/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R {
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:�
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:���������l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 �
ReadVariableOpReadVariableOp7batch_normalization_5_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:�
mul/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:�
mul_1/ReadVariableOpReadVariableOp;batch_normalization_5_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
sub/ReadVariableOpReadVariableOp9batch_normalization_5_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0e
subSubReadVariableOp_1:value:0sub/ReadVariableOp:value:0*
T0*
_output_shapes
:C
mul_2Mulmul:z:0sub:z:0*
T0*
_output_shapes
:�
add_2/ReadVariableOpReadVariableOp9batch_normalization_5_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	�J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	�R
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	�A
NegNegtruediv:z:0*
T0*
_output_shapes
:	�E
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	�L
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	�Q
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	�\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	�6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	�h
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	�T
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	�R
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	�L
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	�A
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	�N
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	�L
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	�S
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	�\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	�L
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:���������f
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:���������a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp/^batch_normalization_5/batchnorm/ReadVariableOp1^batch_normalization_5/batchnorm/ReadVariableOp_11^batch_normalization_5/batchnorm/ReadVariableOp_23^batch_normalization_5/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":����������: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12 
ReadVariableOpReadVariableOp2,
add_2/ReadVariableOpadd_2/ReadVariableOp2d
0batch_normalization_5/batchnorm/ReadVariableOp_10batch_normalization_5/batchnorm/ReadVariableOp_12d
0batch_normalization_5/batchnorm/ReadVariableOp_20batch_normalization_5/batchnorm/ReadVariableOp_22`
.batch_normalization_5/batchnorm/ReadVariableOp.batch_normalization_5/batchnorm/ReadVariableOp2h
2batch_normalization_5/batchnorm/mul/ReadVariableOp2batch_normalization_5/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:($
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
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
<
inputs_1
serving_default_inputs_:0����������;
outputs0
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer-5
layer_with_weights-1
layer-6
layer-7
	layer-8

layer_with_weights-2

layer-9
layer-10
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses
!kernel_quantizer
!kernel_quantizer_internal
"
quantizers

#kernel
 $_jit_compiled_convolution_op"
_tf_keras_layer
�
%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses
+	quantizer"
_tf_keras_layer
�
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses"
_tf_keras_layer
�
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8_random_generator"
_tf_keras_layer
�
9	variables
:trainable_variables
;regularization_losses
<	keras_api
=__call__
*>&call_and_return_all_conditional_losses
?kernel_quantizer
@bias_quantizer
?kernel_quantizer_internal
@bias_quantizer_internal
A
quantizers
B	batchnorm

Ckernel
Dbias
E
_iteration"
_tf_keras_layer
�
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses
L	quantizer"
_tf_keras_layer
�
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses
S_random_generator"
_tf_keras_layer
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses
Zkernel_quantizer
Zkernel_quantizer_internal
[
quantizers

\kernel"
_tf_keras_layer
�
]	variables
^trainable_variables
_regularization_losses
`	keras_api
a__call__
*b&call_and_return_all_conditional_losses
c	quantizer"
_tf_keras_layer
_
#0
C1
D2
d3
e4
E5
f6
g7
\8"
trackable_list_wrapper
J
#0
C1
D2
d3
e4
\5"
trackable_list_wrapper
 "
trackable_list_wrapper
�
hnon_trainable_variables

ilayers
jmetrics
klayer_regularization_losses
llayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
mtrace_0
ntrace_12�
+__inference_cicada-v2_layer_call_fn_1042564
+__inference_cicada-v2_layer_call_fn_1042587�
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
 zmtrace_0zntrace_1
�
otrace_0
ptrace_12�
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042377
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042541�
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
 zotrace_0zptrace_1
�B�
"__inference__wrapped_model_1041851inputs_"�
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
q
_variables
r_iterations
s_learning_rate
t_index_dict
u
_momentums
v_velocities
w_update_step_xla"
_generic_user_object
,
xserving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
ynon_trainable_variables

zlayers
{metrics
|layer_regularization_losses
}layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
~trace_02�
)__inference_reshape_layer_call_fn_1042715�
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
 z~trace_0
�
trace_02�
D__inference_reshape_layer_call_and_return_conditional_losses_1042729�
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
 ztrace_0
'
#0"
trackable_list_wrapper
'
#0"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
&__inference_conv_layer_call_fn_1042736�
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
�
�trace_02�
A__inference_conv_layer_call_and_return_conditional_losses_1042777�
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
_generic_user_object
'
!0"
trackable_list_wrapper
%:#2conv/kernel
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
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
'__inference_relu0_layer_call_fn_1042782�
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
�
�trace_02�
B__inference_relu0_layer_call_and_return_conditional_losses_1042829�
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
_generic_user_object
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
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
)__inference_flatten_layer_call_fn_1042834�
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
D__inference_flatten_layer_call_and_return_conditional_losses_1042840�
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
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses"
_generic_user_object
�
�trace_0
�trace_12�
,__inference_dropout_10_layer_call_fn_1042845
,__inference_dropout_10_layer_call_fn_1042850�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
�
�trace_0
�trace_12�
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042862
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042867�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
"
_generic_user_object
Q
C0
D1
d2
e3
E4
f5
g6"
trackable_list_wrapper
<
C0
D1
d2
e3"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
9	variables
:trainable_variables
;regularization_losses
=__call__
*>&call_and_return_all_conditional_losses
&>"call_and_return_conditional_losses"
_generic_user_object
�
�trace_0
�trace_12�
(__inference_dense1_layer_call_fn_1042886
(__inference_dense1_layer_call_fn_1042905�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
�
�trace_0
�trace_12�
C__inference_dense1_layer_call_and_return_conditional_losses_1043052
C__inference_dense1_layer_call_and_return_conditional_losses_1043174�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
"
_generic_user_object
"
_generic_user_object
.
?0
@1"
trackable_list_wrapper
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
	�axis
	dgamma
ebeta
fmoving_mean
gmoving_variance"
_tf_keras_layer
 :	�2dense1/kernel
:2dense1/bias
:	 2dense1/iteration
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
'__inference_relu1_layer_call_fn_1043179�
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
�
�trace_02�
B__inference_relu1_layer_call_and_return_conditional_losses_1043226�
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
_generic_user_object
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
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
�
�trace_0
�trace_12�
,__inference_dropout_11_layer_call_fn_1043231
,__inference_dropout_11_layer_call_fn_1043236�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
�
�trace_0
�trace_12�
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043248
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043253�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1
"
_generic_user_object
'
\0"
trackable_list_wrapper
'
\0"
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
(__inference_dense2_layer_call_fn_1043260�
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
�
�trace_02�
C__inference_dense2_layer_call_and_return_conditional_losses_1043301�
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
_generic_user_object
'
Z0"
trackable_list_wrapper
:2dense2/kernel
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
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
)__inference_outputs_layer_call_fn_1043306�
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
D__inference_outputs_layer_call_and_return_conditional_losses_1043353�
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
_generic_user_object
0:.2"dense1/batch_normalization_5/gamma
/:-2!dense1/batch_normalization_5/beta
8:6 (2(dense1/batch_normalization_5/moving_mean
<:: (2,dense1/batch_normalization_5/moving_variance
5
E0
f1
g2"
trackable_list_wrapper
n
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
10"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
+__inference_cicada-v2_layer_call_fn_1042564inputs_"�
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
+__inference_cicada-v2_layer_call_fn_1042587inputs_"�
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
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042377inputs_"�
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
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042541inputs_"�
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
�
r0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
P
�0
�1
�2
�3
�4
�5"
trackable_list_wrapper
P
�0
�1
�2
�3
�4
�5"
trackable_list_wrapper
�2��
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
 0
�B�
%__inference_signature_wrapper_1042710inputs_"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs�
	jinputs_
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
)__inference_reshape_layer_call_fn_1042715inputs"�
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
D__inference_reshape_layer_call_and_return_conditional_losses_1042729inputs"�
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
&__inference_conv_layer_call_fn_1042736inputs"�
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
A__inference_conv_layer_call_and_return_conditional_losses_1042777inputs"�
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
'__inference_relu0_layer_call_fn_1042782inputs"�
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
B__inference_relu0_layer_call_and_return_conditional_losses_1042829inputs"�
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
)__inference_flatten_layer_call_fn_1042834inputs"�
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
D__inference_flatten_layer_call_and_return_conditional_losses_1042840inputs"�
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
,__inference_dropout_10_layer_call_fn_1042845inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
,__inference_dropout_10_layer_call_fn_1042850inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042862inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042867inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
5
E0
f1
g2"
trackable_list_wrapper
'
B0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
(__inference_dense1_layer_call_fn_1042886inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
(__inference_dense1_layer_call_fn_1042905inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
C__inference_dense1_layer_call_and_return_conditional_losses_1043052inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
C__inference_dense1_layer_call_and_return_conditional_losses_1043174inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
<
d0
e1
f2
g3"
trackable_list_wrapper
.
d0
e1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_0
�trace_12�
7__inference_batch_normalization_5_layer_call_fn_1043366
7__inference_batch_normalization_5_layer_call_fn_1043379�
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
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043413
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043433�
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
 "
trackable_list_wrapper
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
'__inference_relu1_layer_call_fn_1043179inputs"�
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
B__inference_relu1_layer_call_and_return_conditional_losses_1043226inputs"�
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
,__inference_dropout_11_layer_call_fn_1043231inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
,__inference_dropout_11_layer_call_fn_1043236inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043248inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043253inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
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
(__inference_dense2_layer_call_fn_1043260inputs"�
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
C__inference_dense2_layer_call_and_return_conditional_losses_1043301inputs"�
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
)__inference_outputs_layer_call_fn_1043306inputs"�
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
D__inference_outputs_layer_call_and_return_conditional_losses_1043353inputs"�
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
�	variables
�	keras_api

�total

�count"
_tf_keras_metric
*:(2Adam/m/conv/kernel
*:(2Adam/v/conv/kernel
%:#	�2Adam/m/dense1/kernel
%:#	�2Adam/v/dense1/kernel
:2Adam/m/dense1/bias
:2Adam/v/dense1/bias
5:32)Adam/m/dense1/batch_normalization_5/gamma
5:32)Adam/v/dense1/batch_normalization_5/gamma
4:22(Adam/m/dense1/batch_normalization_5/beta
4:22(Adam/v/dense1/batch_normalization_5/beta
$:"2Adam/m/dense2/kernel
$:"2Adam/v/dense2/kernel
.
f0
g1"
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
7__inference_batch_normalization_5_layer_call_fn_1043366inputs"�
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
7__inference_batch_normalization_5_layer_call_fn_1043379inputs"�
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
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043413inputs"�
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
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043433inputs"�
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
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count�
"__inference__wrapped_model_1041851q	#CDgdfeE\1�.
'�$
"�
inputs_����������
� "1�.
,
outputs!�
outputs����������
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043413mfgde7�4
-�*
 �
inputs���������
p

 
� ",�)
"�
tensor_0���������
� �
R__inference_batch_normalization_5_layer_call_and_return_conditional_losses_1043433mgdfe7�4
-�*
 �
inputs���������
p 

 
� ",�)
"�
tensor_0���������
� �
7__inference_batch_normalization_5_layer_call_fn_1043366bfgde7�4
-�*
 �
inputs���������
p

 
� "!�
unknown����������
7__inference_batch_normalization_5_layer_call_fn_1043379bgdfe7�4
-�*
 �
inputs���������
p 

 
� "!�
unknown����������
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042377t	#CDfgdeE\9�6
/�,
"�
inputs_����������
p

 
� ",�)
"�
tensor_0���������
� �
F__inference_cicada-v2_layer_call_and_return_conditional_losses_1042541t	#CDgdfeE\9�6
/�,
"�
inputs_����������
p 

 
� ",�)
"�
tensor_0���������
� �
+__inference_cicada-v2_layer_call_fn_1042564i	#CDfgdeE\9�6
/�,
"�
inputs_����������
p

 
� "!�
unknown����������
+__inference_cicada-v2_layer_call_fn_1042587i	#CDgdfeE\9�6
/�,
"�
inputs_����������
p 

 
� "!�
unknown����������
A__inference_conv_layer_call_and_return_conditional_losses_1042777r#7�4
-�*
(�%
inputs���������
� "4�1
*�'
tensor_0���������	
� �
&__inference_conv_layer_call_fn_1042736g#7�4
-�*
(�%
inputs���������
� ")�&
unknown���������	�
C__inference_dense1_layer_call_and_return_conditional_losses_1043052mCDfgdeE4�1
*�'
!�
inputs����������
p
� ",�)
"�
tensor_0���������
� �
C__inference_dense1_layer_call_and_return_conditional_losses_1043174mCDgdfeE4�1
*�'
!�
inputs����������
p 
� ",�)
"�
tensor_0���������
� �
(__inference_dense1_layer_call_fn_1042886bCDfgdeE4�1
*�'
!�
inputs����������
p
� "!�
unknown����������
(__inference_dense1_layer_call_fn_1042905bCDgdfeE4�1
*�'
!�
inputs����������
p 
� "!�
unknown����������
C__inference_dense2_layer_call_and_return_conditional_losses_1043301b\/�,
%�"
 �
inputs���������
� ",�)
"�
tensor_0���������
� �
(__inference_dense2_layer_call_fn_1043260W\/�,
%�"
 �
inputs���������
� "!�
unknown����������
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042862e4�1
*�'
!�
inputs����������
p
� "-�*
#� 
tensor_0����������
� �
G__inference_dropout_10_layer_call_and_return_conditional_losses_1042867e4�1
*�'
!�
inputs����������
p 
� "-�*
#� 
tensor_0����������
� �
,__inference_dropout_10_layer_call_fn_1042845Z4�1
*�'
!�
inputs����������
p
� ""�
unknown�����������
,__inference_dropout_10_layer_call_fn_1042850Z4�1
*�'
!�
inputs����������
p 
� ""�
unknown�����������
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043248c3�0
)�&
 �
inputs���������
p
� ",�)
"�
tensor_0���������
� �
G__inference_dropout_11_layer_call_and_return_conditional_losses_1043253c3�0
)�&
 �
inputs���������
p 
� ",�)
"�
tensor_0���������
� �
,__inference_dropout_11_layer_call_fn_1043231X3�0
)�&
 �
inputs���������
p
� "!�
unknown����������
,__inference_dropout_11_layer_call_fn_1043236X3�0
)�&
 �
inputs���������
p 
� "!�
unknown����������
D__inference_flatten_layer_call_and_return_conditional_losses_1042840h7�4
-�*
(�%
inputs���������	
� "-�*
#� 
tensor_0����������
� �
)__inference_flatten_layer_call_fn_1042834]7�4
-�*
(�%
inputs���������	
� ""�
unknown�����������
D__inference_outputs_layer_call_and_return_conditional_losses_1043353_/�,
%�"
 �
inputs���������
� ",�)
"�
tensor_0���������
� �
)__inference_outputs_layer_call_fn_1043306T/�,
%�"
 �
inputs���������
� "!�
unknown����������
B__inference_relu0_layer_call_and_return_conditional_losses_1042829o7�4
-�*
(�%
inputs���������	
� "4�1
*�'
tensor_0���������	
� �
'__inference_relu0_layer_call_fn_1042782d7�4
-�*
(�%
inputs���������	
� ")�&
unknown���������	�
B__inference_relu1_layer_call_and_return_conditional_losses_1043226_/�,
%�"
 �
inputs���������
� ",�)
"�
tensor_0���������
� 
'__inference_relu1_layer_call_fn_1043179T/�,
%�"
 �
inputs���������
� "!�
unknown����������
D__inference_reshape_layer_call_and_return_conditional_losses_1042729h0�-
&�#
!�
inputs����������
� "4�1
*�'
tensor_0���������
� �
)__inference_reshape_layer_call_fn_1042715]0�-
&�#
!�
inputs����������
� ")�&
unknown����������
%__inference_signature_wrapper_1042710|	#CDgdfeE\<�9
� 
2�/
-
inputs_"�
inputs_����������"1�.
,
outputs!�
outputs���������