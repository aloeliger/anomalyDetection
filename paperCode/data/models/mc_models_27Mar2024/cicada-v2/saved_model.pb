џЪ
ъК
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
E
AssignAddVariableOp
resource
value"dtype"
dtypetype
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
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

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
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
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
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
>
Maximum
x"T
y"T
z"T"
Ttype:
2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	

MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( 
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
2	
0
Neg
x"T
y"T"
Ttype:
2
	
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
dtypetype
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
list(type)(0
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
list(type)(0
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
P
Shape

input"T
output"out_type"	
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

2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
С
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
executor_typestring Ј
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
ї
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
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.10.02v2.10.0-rc3-6-g359c3cdfc5f8Ф
Ј
(Adam/dense1/batch_normalization_1/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(Adam/dense1/batch_normalization_1/beta/v
Ё
<Adam/dense1/batch_normalization_1/beta/v/Read/ReadVariableOpReadVariableOp(Adam/dense1/batch_normalization_1/beta/v*
_output_shapes
:*
dtype0
Њ
)Adam/dense1/batch_normalization_1/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*:
shared_name+)Adam/dense1/batch_normalization_1/gamma/v
Ѓ
=Adam/dense1/batch_normalization_1/gamma/v/Read/ReadVariableOpReadVariableOp)Adam/dense1/batch_normalization_1/gamma/v*
_output_shapes
:*
dtype0

Adam/dense2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/dense2/kernel/v
}
(Adam/dense2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense2/kernel/v*
_output_shapes

:*
dtype0
|
Adam/dense1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/dense1/bias/v
u
&Adam/dense1/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense1/bias/v*
_output_shapes
:*
dtype0

Adam/dense1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ќ*%
shared_nameAdam/dense1/kernel/v
~
(Adam/dense1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense1/kernel/v*
_output_shapes
:	ќ*
dtype0

Adam/conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/conv/kernel/v

&Adam/conv/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv/kernel/v*&
_output_shapes
:*
dtype0
Ј
(Adam/dense1/batch_normalization_1/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(Adam/dense1/batch_normalization_1/beta/m
Ё
<Adam/dense1/batch_normalization_1/beta/m/Read/ReadVariableOpReadVariableOp(Adam/dense1/batch_normalization_1/beta/m*
_output_shapes
:*
dtype0
Њ
)Adam/dense1/batch_normalization_1/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*:
shared_name+)Adam/dense1/batch_normalization_1/gamma/m
Ѓ
=Adam/dense1/batch_normalization_1/gamma/m/Read/ReadVariableOpReadVariableOp)Adam/dense1/batch_normalization_1/gamma/m*
_output_shapes
:*
dtype0

Adam/dense2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/dense2/kernel/m
}
(Adam/dense2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense2/kernel/m*
_output_shapes

:*
dtype0
|
Adam/dense1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/dense1/bias/m
u
&Adam/dense1/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense1/bias/m*
_output_shapes
:*
dtype0

Adam/dense1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ќ*%
shared_nameAdam/dense1/kernel/m
~
(Adam/dense1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense1/kernel/m*
_output_shapes
:	ќ*
dtype0

Adam/conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/conv/kernel/m

&Adam/conv/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv/kernel/m*&
_output_shapes
:*
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
А
,dense1/batch_normalization_1/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*=
shared_name.,dense1/batch_normalization_1/moving_variance
Љ
@dense1/batch_normalization_1/moving_variance/Read/ReadVariableOpReadVariableOp,dense1/batch_normalization_1/moving_variance*
_output_shapes
:*
dtype0
Ј
(dense1/batch_normalization_1/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(dense1/batch_normalization_1/moving_mean
Ё
<dense1/batch_normalization_1/moving_mean/Read/ReadVariableOpReadVariableOp(dense1/batch_normalization_1/moving_mean*
_output_shapes
:*
dtype0

!dense1/batch_normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!dense1/batch_normalization_1/beta

5dense1/batch_normalization_1/beta/Read/ReadVariableOpReadVariableOp!dense1/batch_normalization_1/beta*
_output_shapes
:*
dtype0

"dense1/batch_normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"dense1/batch_normalization_1/gamma

6dense1/batch_normalization_1/gamma/Read/ReadVariableOpReadVariableOp"dense1/batch_normalization_1/gamma*
_output_shapes
:*
dtype0
v
dense2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*
shared_namedense2/kernel
o
!dense2/kernel/Read/ReadVariableOpReadVariableOpdense2/kernel*
_output_shapes

:*
dtype0
t
dense1/iterationVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *!
shared_namedense1/iteration
m
$dense1/iteration/Read/ReadVariableOpReadVariableOpdense1/iteration*
_output_shapes
: *
dtype0	
n
dense1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense1/bias
g
dense1/bias/Read/ReadVariableOpReadVariableOpdense1/bias*
_output_shapes
:*
dtype0
w
dense1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ќ*
shared_namedense1/kernel
p
!dense1/kernel/Read/ReadVariableOpReadVariableOpdense1/kernel*
_output_shapes
:	ќ*
dtype0
z
conv/kernelVarHandleOp*
_output_shapes
: *
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
:џџџџџџџџџќ*
dtype0*
shape:џџџџџџџџџќ
­
StatefulPartitionedCallStatefulPartitionedCallserving_default_inputs_conv/kerneldense1/kerneldense1/bias,dense1/batch_normalization_1/moving_variance"dense1/batch_normalization_1/gamma(dense1/batch_normalization_1/moving_mean!dense1/batch_normalization_1/betadense1/iterationdense2/kernel*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8 *.
f)R'
%__inference_signature_wrapper_8678854

NoOpNoOp
ђV
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*­V
valueЃVB V BV
Њ
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

	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 

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

%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses
+	quantizer* 

,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses* 
Ѕ
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8_random_generator* 
Л
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

F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses
L	quantizer* 
Ѕ
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses
S_random_generator* 
с
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

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
А
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
6
mtrace_0
ntrace_1
otrace_2
ptrace_3* 
6
qtrace_0
rtrace_1
strace_2
ttrace_3* 
* 
М
uiter

vbeta_1

wbeta_2
	xdecay
ylearning_rate#mмCmнDmо\mпdmрemс#vтCvуDvф\vхdvцevч*

zserving_default* 
* 
* 
* 

{non_trainable_variables

|layers
}metrics
~layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

trace_0* 

trace_0* 

#0*

#0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses*

trace_0* 

trace_0* 
* 
	
!0* 
[U
VARIABLE_VALUEconv/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses* 

trace_0* 

trace_0* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses* 

trace_0* 

trace_0* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses* 

trace_0
trace_1* 

trace_0
trace_1* 
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

 non_trainable_variables
Ёlayers
Ђmetrics
 Ѓlayer_regularization_losses
Єlayer_metrics
9	variables
:trainable_variables
;regularization_losses
=__call__
*>&call_and_return_all_conditional_losses
&>"call_and_return_conditional_losses*

Ѕtrace_0
Іtrace_1* 

Їtrace_0
Јtrace_1* 
* 
* 

?0
@1* 
м
Љ	variables
Њtrainable_variables
Ћregularization_losses
Ќ	keras_api
­__call__
+Ў&call_and_return_all_conditional_losses
	Џaxis
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

Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses* 

Еtrace_0* 

Жtrace_0* 
* 
* 
* 
* 

Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses* 

Мtrace_0
Нtrace_1* 

Оtrace_0
Пtrace_1* 
* 

\0*

\0*
* 

Рnon_trainable_variables
Сlayers
Тmetrics
 Уlayer_regularization_losses
Фlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses*

Хtrace_0* 

Цtrace_0* 
* 
	
Z0* 
]W
VARIABLE_VALUEdense2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 

Чnon_trainable_variables
Шlayers
Щmetrics
 Ъlayer_regularization_losses
Ыlayer_metrics
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses* 

Ьtrace_0* 

Эtrace_0* 
* 
b\
VARIABLE_VALUE"dense1/batch_normalization_1/gamma&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUE!dense1/batch_normalization_1/beta&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUE(dense1/batch_normalization_1/moving_mean&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
lf
VARIABLE_VALUE,dense1/batch_normalization_1/moving_variance&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
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

Ю0*
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
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
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

Яnon_trainable_variables
аlayers
бmetrics
 вlayer_regularization_losses
гlayer_metrics
Љ	variables
Њtrainable_variables
Ћregularization_losses
­__call__
+Ў&call_and_return_all_conditional_losses
'Ў"call_and_return_conditional_losses*

дtrace_0
еtrace_1* 

жtrace_0
зtrace_1* 
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
и	variables
й	keras_api

кtotal

лcount*
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
к0
л1*

и	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/conv/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
z
VARIABLE_VALUEAdam/dense1/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense1/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
z
VARIABLE_VALUEAdam/dense2/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE)Adam/dense1/batch_normalization_1/gamma/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE(Adam/dense1/batch_normalization_1/beta/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/conv/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
z
VARIABLE_VALUEAdam/dense1/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense1/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
z
VARIABLE_VALUEAdam/dense2/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE)Adam/dense1/batch_normalization_1/gamma/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE(Adam/dense1/batch_normalization_1/beta/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
і
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenameconv/kernel/Read/ReadVariableOp!dense1/kernel/Read/ReadVariableOpdense1/bias/Read/ReadVariableOp$dense1/iteration/Read/ReadVariableOp!dense2/kernel/Read/ReadVariableOp6dense1/batch_normalization_1/gamma/Read/ReadVariableOp5dense1/batch_normalization_1/beta/Read/ReadVariableOp<dense1/batch_normalization_1/moving_mean/Read/ReadVariableOp@dense1/batch_normalization_1/moving_variance/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp&Adam/conv/kernel/m/Read/ReadVariableOp(Adam/dense1/kernel/m/Read/ReadVariableOp&Adam/dense1/bias/m/Read/ReadVariableOp(Adam/dense2/kernel/m/Read/ReadVariableOp=Adam/dense1/batch_normalization_1/gamma/m/Read/ReadVariableOp<Adam/dense1/batch_normalization_1/beta/m/Read/ReadVariableOp&Adam/conv/kernel/v/Read/ReadVariableOp(Adam/dense1/kernel/v/Read/ReadVariableOp&Adam/dense1/bias/v/Read/ReadVariableOp(Adam/dense2/kernel/v/Read/ReadVariableOp=Adam/dense1/batch_normalization_1/gamma/v/Read/ReadVariableOp<Adam/dense1/batch_normalization_1/beta/v/Read/ReadVariableOpConst*)
Tin"
 2		*
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
GPU 2J 8 *)
f$R"
 __inference__traced_save_8680465
С
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv/kerneldense1/kerneldense1/biasdense1/iterationdense2/kernel"dense1/batch_normalization_1/gamma!dense1/batch_normalization_1/beta(dense1/batch_normalization_1/moving_mean,dense1/batch_normalization_1/moving_variance	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcountAdam/conv/kernel/mAdam/dense1/kernel/mAdam/dense1/bias/mAdam/dense2/kernel/m)Adam/dense1/batch_normalization_1/gamma/m(Adam/dense1/batch_normalization_1/beta/mAdam/conv/kernel/vAdam/dense1/kernel/vAdam/dense1/bias/vAdam/dense2/kernel/v)Adam/dense1/batch_normalization_1/gamma/v(Adam/dense1/batch_normalization_1/beta/v*(
Tin!
2*
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
GPU 2J 8 *,
f'R%
#__inference__traced_restore_8680559рх
ь	
д
+__inference_cicada-v2_layer_call_fn_8678877

inputs!
unknown:
	unknown_0:	ќ
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityЂStatefulPartitionedCallЕ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678359o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
џ
Ф
C__inference_dense2_layer_call_and_return_conditional_losses_8680224

inputs)
readvariableop_resource:
identityЂReadVariableOpЂReadVariableOp_1ЂReadVariableOp_2J
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
 *  ?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?D
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
 *  ?V
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
 *  ?R
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
:џџџџџџџџџ_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Њ
в
7__inference_batch_normalization_1_layer_call_fn_8680291

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *[
fVRT
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8677874o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Й
C
'__inference_relu0_layer_call_fn_8679701

inputs
identityЕ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_8678049h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
	

(__inference_dense1_layer_call_fn_8679807

inputs
unknown:	ќ
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_8678188o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":џџџџџџџџџќ: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Е"
^
B__inference_relu0_layer_call_and_return_conditional_losses_8678049

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
:џџџџџџџџџ	N
ReluReluinputs*
T0*/
_output_shapes
:џџџџџџџџџ	E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
mulMulones_like:output:0	sub_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	z
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	X
mul_1MulinputsCast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	c
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	Q
NegNegtruediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	U
RoundRoundtruediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	Z
addAddV2Neg:y:0	Round:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	_
StopGradientStopGradientadd:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	l
add_1AddV2truediv:z:0StopGradient:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	c
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: t
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	e
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	Y
Neg_1NegSelectV2:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	^
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?c
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	c
StopGradient_1StopGradient	mul_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	t
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	Y
IdentityIdentity	add_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
ј
Ъ
A__inference_conv_layer_call_and_return_conditional_losses_8677996

inputs1
readvariableop_resource:
identityЂReadVariableOpЂReadVariableOp_1ЂReadVariableOp_2J
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
 *  ?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?D
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
 *  ?^
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
 *  ?Z
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
:
convolutionConv2Dinputs	add_4:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingVALID*
strides
k
IdentityIdentityconvolution:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:џџџџџџџџџ: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Х	
Я
%__inference_signature_wrapper_8678854
inputs_!
unknown:
	unknown_0:	ќ
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference__wrapped_model_8677850o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:џџџџџџџџџќ
!
_user_specified_name	inputs_

|
(__inference_dense2_layer_call_fn_8680183

inputs
unknown:
identityЂStatefulPartitionedCallЫ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_8678303o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
j
Ж
C__inference_dense1_layer_call_and_return_conditional_losses_8679948

inputs1
matmul_readvariableop_resource:	ќ-
biasadd_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:G
9batch_normalization_1_batchnorm_readvariableop_1_resource:G
9batch_normalization_1_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identityЂAssignAddVariableOpЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpЂReadVariableOpЂReadVariableOp_1Ђadd_2/ReadVariableOpЂ.batch_normalization_1/batchnorm/ReadVariableOpЂ0batch_normalization_1/batchnorm/ReadVariableOp_1Ђ0batch_normalization_1/batchnorm/ReadVariableOp_2Ђ2batch_normalization_1/batchnorm/mul/ReadVariableOpЂmul/ReadVariableOpЂmul_1/ReadVariableOpЂmul_3/ReadVariableOpЂsub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџЂ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Й
#batch_normalization_1/batchnorm/addAddV26batch_normalization_1/batchnorm/ReadVariableOp:value:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:Њ
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ж
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџІ
0batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0Д
%batch_normalization_1/batchnorm/mul_2Mul8batch_normalization_1/batchnorm/ReadVariableOp_1:value:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:І
0batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0Д
#batch_normalization_1/batchnorm/subSub8batch_normalization_1/batchnorm/ReadVariableOp_2:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Д
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:џџџџџџџџџG
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
valueB: 
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
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
 
ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Y
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
 *o:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
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
dtype0
sub/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
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
:
add_2/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ќJ
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
 *  р@K
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
 *  ?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ќR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ќA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ќE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ќL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ќQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ќ\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ќ6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ќh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ќT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ќR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ќL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ќA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ќN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ќL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ќS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ќ\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ќL
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
 *  р@Q
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
 *  ?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?M
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
 *  ?J
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
 *  ?T
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
 *  ?Q
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
:џџџџџџџџџf
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:џџџџџџџџџa
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџь
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp1^batch_normalization_1/batchnorm/ReadVariableOp_11^batch_normalization_1/batchnorm/ReadVariableOp_23^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":џџџџџџџџџќ: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12,
add_2/ReadVariableOpadd_2/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2d
0batch_normalization_1/batchnorm/ReadVariableOp_10batch_normalization_1/batchnorm/ReadVariableOp_12d
0batch_normalization_1/batchnorm/ReadVariableOp_20batch_normalization_1/batchnorm/ReadVariableOp_22h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Д?
п
 __inference__traced_save_8680465
file_prefix*
&savev2_conv_kernel_read_readvariableop,
(savev2_dense1_kernel_read_readvariableop*
&savev2_dense1_bias_read_readvariableop/
+savev2_dense1_iteration_read_readvariableop	,
(savev2_dense2_kernel_read_readvariableopA
=savev2_dense1_batch_normalization_1_gamma_read_readvariableop@
<savev2_dense1_batch_normalization_1_beta_read_readvariableopG
Csavev2_dense1_batch_normalization_1_moving_mean_read_readvariableopK
Gsavev2_dense1_batch_normalization_1_moving_variance_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop1
-savev2_adam_conv_kernel_m_read_readvariableop3
/savev2_adam_dense1_kernel_m_read_readvariableop1
-savev2_adam_dense1_bias_m_read_readvariableop3
/savev2_adam_dense2_kernel_m_read_readvariableopH
Dsavev2_adam_dense1_batch_normalization_1_gamma_m_read_readvariableopG
Csavev2_adam_dense1_batch_normalization_1_beta_m_read_readvariableop1
-savev2_adam_conv_kernel_v_read_readvariableop3
/savev2_adam_dense1_kernel_v_read_readvariableop1
-savev2_adam_dense1_bias_v_read_readvariableop3
/savev2_adam_dense2_kernel_v_read_readvariableopH
Dsavev2_adam_dense1_batch_normalization_1_gamma_v_read_readvariableopG
Csavev2_adam_dense1_batch_normalization_1_beta_v_read_readvariableop
savev2_const

identity_1ЂMergeV2Checkpointsw
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
_temp/part
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
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: С
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*ъ
valueрBнB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЇ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B Ю
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0&savev2_conv_kernel_read_readvariableop(savev2_dense1_kernel_read_readvariableop&savev2_dense1_bias_read_readvariableop+savev2_dense1_iteration_read_readvariableop(savev2_dense2_kernel_read_readvariableop=savev2_dense1_batch_normalization_1_gamma_read_readvariableop<savev2_dense1_batch_normalization_1_beta_read_readvariableopCsavev2_dense1_batch_normalization_1_moving_mean_read_readvariableopGsavev2_dense1_batch_normalization_1_moving_variance_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop-savev2_adam_conv_kernel_m_read_readvariableop/savev2_adam_dense1_kernel_m_read_readvariableop-savev2_adam_dense1_bias_m_read_readvariableop/savev2_adam_dense2_kernel_m_read_readvariableopDsavev2_adam_dense1_batch_normalization_1_gamma_m_read_readvariableopCsavev2_adam_dense1_batch_normalization_1_beta_m_read_readvariableop-savev2_adam_conv_kernel_v_read_readvariableop/savev2_adam_dense1_kernel_v_read_readvariableop-savev2_adam_dense1_bias_v_read_readvariableop/savev2_adam_dense2_kernel_v_read_readvariableopDsavev2_adam_dense1_batch_normalization_1_gamma_v_read_readvariableopCsavev2_adam_dense1_batch_normalization_1_beta_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *+
dtypes!
2		
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*р
_input_shapesЮ
Ы: ::	ќ:: :::::: : : : : : : ::	ќ::::::	ќ::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
::%!

_output_shapes
:	ќ: 

_output_shapes
::

_output_shapes
: :$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 	

_output_shapes
::


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :,(
&
_output_shapes
::%!

_output_shapes
:	ќ: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
::%!

_output_shapes
:	ќ: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
::

_output_shapes
: 
Д(
Ќ
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678823
inputs_&
conv_8678795:!
dense1_8678801:	ќ
dense1_8678803:
dense1_8678805:
dense1_8678807:
dense1_8678809:
dense1_8678811:
dense1_8678813:	  
dense2_8678818:
identityЂconv/StatefulPartitionedCallЂdense1/StatefulPartitionedCallЂdense2/StatefulPartitionedCallЂ!dropout_1/StatefulPartitionedCallЂ!dropout_2/StatefulPartitionedCallР
reshape/PartitionedCallPartitionedCallinputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_8677953ѕ
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_8678795*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_8677996к
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_8678049а
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_8678057ц
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678629ц
dense1/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense1_8678801dense1_8678803dense1_8678805dense1_8678807dense1_8678809dense1_8678811dense1_8678813*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_8678592д
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_8678253
!dropout_2/StatefulPartitionedCallStatefulPartitionedCallrelu1/PartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678414§
dense2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense2_8678818*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_8678303и
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_8678356o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџя
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall:Q M
(
_output_shapes
:џџџџџџџџџќ
!
_user_specified_name	inputs_
н
d
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679776

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:џџџџџџџџџќ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Э
`
D__inference_reshape_layer_call_and_return_conditional_losses_8677953

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
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
valueB:б
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
value	B :Љ
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Я
Б
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8677874

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identityЂbatchnorm/ReadVariableOpЂbatchnorm/ReadVariableOp_1Ђbatchnorm/ReadVariableOp_2Ђbatchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:w
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
:џџџџџџџџџz
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
:џџџџџџџџџb
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџК
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
r
џ
#__inference__traced_restore_8680559
file_prefix6
assignvariableop_conv_kernel:3
 assignvariableop_1_dense1_kernel:	ќ,
assignvariableop_2_dense1_bias:-
#assignvariableop_3_dense1_iteration:	 2
 assignvariableop_4_dense2_kernel:C
5assignvariableop_5_dense1_batch_normalization_1_gamma:B
4assignvariableop_6_dense1_batch_normalization_1_beta:I
;assignvariableop_7_dense1_batch_normalization_1_moving_mean:M
?assignvariableop_8_dense1_batch_normalization_1_moving_variance:&
assignvariableop_9_adam_iter:	 )
assignvariableop_10_adam_beta_1: )
assignvariableop_11_adam_beta_2: (
assignvariableop_12_adam_decay: 0
&assignvariableop_13_adam_learning_rate: #
assignvariableop_14_total: #
assignvariableop_15_count: @
&assignvariableop_16_adam_conv_kernel_m:;
(assignvariableop_17_adam_dense1_kernel_m:	ќ4
&assignvariableop_18_adam_dense1_bias_m::
(assignvariableop_19_adam_dense2_kernel_m:K
=assignvariableop_20_adam_dense1_batch_normalization_1_gamma_m:J
<assignvariableop_21_adam_dense1_batch_normalization_1_beta_m:@
&assignvariableop_22_adam_conv_kernel_v:;
(assignvariableop_23_adam_dense1_kernel_v:	ќ4
&assignvariableop_24_adam_dense1_bias_v::
(assignvariableop_25_adam_dense2_kernel_v:K
=assignvariableop_26_adam_dense1_batch_normalization_1_gamma_v:J
<assignvariableop_27_adam_dense1_batch_normalization_1_beta_v:
identity_29ЂAssignVariableOpЂAssignVariableOp_1ЂAssignVariableOp_10ЂAssignVariableOp_11ЂAssignVariableOp_12ЂAssignVariableOp_13ЂAssignVariableOp_14ЂAssignVariableOp_15ЂAssignVariableOp_16ЂAssignVariableOp_17ЂAssignVariableOp_18ЂAssignVariableOp_19ЂAssignVariableOp_2ЂAssignVariableOp_20ЂAssignVariableOp_21ЂAssignVariableOp_22ЂAssignVariableOp_23ЂAssignVariableOp_24ЂAssignVariableOp_25ЂAssignVariableOp_26ЂAssignVariableOp_27ЂAssignVariableOp_3ЂAssignVariableOp_4ЂAssignVariableOp_5ЂAssignVariableOp_6ЂAssignVariableOp_7ЂAssignVariableOp_8ЂAssignVariableOp_9Ф
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*ъ
valueрBнB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЊ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B А
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*
_output_shapesv
t:::::::::::::::::::::::::::::*+
dtypes!
2		[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOpAssignVariableOpassignvariableop_conv_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOp assignvariableop_1_dense1_kernelIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_2AssignVariableOpassignvariableop_2_dense1_biasIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOp_3AssignVariableOp#assignvariableop_3_dense1_iterationIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_4AssignVariableOp assignvariableop_4_dense2_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_5AssignVariableOp5assignvariableop_5_dense1_batch_normalization_1_gammaIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:Ѓ
AssignVariableOp_6AssignVariableOp4assignvariableop_6_dense1_batch_normalization_1_betaIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:Њ
AssignVariableOp_7AssignVariableOp;assignvariableop_7_dense1_batch_normalization_1_moving_meanIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:Ў
AssignVariableOp_8AssignVariableOp?assignvariableop_8_dense1_batch_normalization_1_moving_varianceIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOp_9AssignVariableOpassignvariableop_9_adam_iterIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_beta_1Identity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_beta_2Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_decayIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_13AssignVariableOp&assignvariableop_13_adam_learning_rateIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_14AssignVariableOpassignvariableop_14_totalIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_15AssignVariableOpassignvariableop_15_countIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_16AssignVariableOp&assignvariableop_16_adam_conv_kernel_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_17AssignVariableOp(assignvariableop_17_adam_dense1_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_18AssignVariableOp&assignvariableop_18_adam_dense1_bias_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_19AssignVariableOp(assignvariableop_19_adam_dense2_kernel_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Ў
AssignVariableOp_20AssignVariableOp=assignvariableop_20_adam_dense1_batch_normalization_1_gamma_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_21AssignVariableOp<assignvariableop_21_adam_dense1_batch_normalization_1_beta_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_22AssignVariableOp&assignvariableop_22_adam_conv_kernel_vIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_23AssignVariableOp(assignvariableop_23_adam_dense1_kernel_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_24AssignVariableOp&assignvariableop_24_adam_dense1_bias_vIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_25AssignVariableOp(assignvariableop_25_adam_dense2_kernel_vIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:Ў
AssignVariableOp_26AssignVariableOp=assignvariableop_26_adam_dense1_batch_normalization_1_gamma_vIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_27AssignVariableOp<assignvariableop_27_adam_dense1_batch_normalization_1_beta_vIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 З
Identity_28Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_29IdentityIdentity_28:output:0^NoOp_1*
T0*
_output_shapes
: Є
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_29Identity_29:output:0*M
_input_shapes<
:: : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
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
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
є 
^
B__inference_relu1_layer_call_and_return_conditional_losses_8678253

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
:џџџџџџџџџF
ReluReluinputs*
T0*'
_output_shapes
:џџџџџџџџџE
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџD
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџr
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџP
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:џџџџџџџџџ[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџI
NegNegtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџM
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџR
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџW
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:џџџџџџџџџd
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџP
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџT
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџQ
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџV
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџL
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџl
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџQ
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Т%
ф
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678791
inputs_&
conv_8678763:!
dense1_8678769:	ќ
dense1_8678771:
dense1_8678773:
dense1_8678775:
dense1_8678777:
dense1_8678779:
dense1_8678781:	  
dense2_8678786:
identityЂconv/StatefulPartitionedCallЂdense1/StatefulPartitionedCallЂdense2/StatefulPartitionedCallР
reshape/PartitionedCallPartitionedCallinputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_8677953ѕ
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_8678763*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_8677996к
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_8678049а
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_8678057ж
dropout_1/PartitionedCallPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678064р
dense1/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense1_8678769dense1_8678771dense1_8678773dense1_8678775dense1_8678777dense1_8678779dense1_8678781*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_8678188д
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_8678253г
dropout_2/PartitionedCallPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678260ѕ
dense2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense2_8678786*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_8678303и
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_8678356o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџЇ
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall:Q M
(
_output_shapes
:џџџџџџџџџќ
!
_user_specified_name	inputs_
є 
^
B__inference_relu1_layer_call_and_return_conditional_losses_8680149

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
:џџџџџџџџџF
ReluReluinputs*
T0*'
_output_shapes
:џџџџџџџџџE
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџD
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџr
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџP
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:џџџџџџџџџ[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџI
NegNegtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџM
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџR
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџW
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:џџџџџџџџџd
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџP
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџT
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџQ
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџV
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџL
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџl
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџQ
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Я
Б
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680324

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identityЂbatchnorm/ReadVariableOpЂbatchnorm/ReadVariableOp_1Ђbatchnorm/ReadVariableOp_2Ђbatchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:w
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
:џџџџџџџџџz
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
:џџџџџџџџџb
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџК
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs


C__inference_dense1_layer_call_and_return_conditional_losses_8680095

inputs1
matmul_readvariableop_resource:	ќ-
biasadd_readvariableop_resource:K
=batch_normalization_1_assignmovingavg_readvariableop_resource:M
?batch_normalization_1_assignmovingavg_1_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identityЂAssignAddVariableOpЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpЂReadVariableOpЂReadVariableOp_1ЂReadVariableOp_2Ђadd_2/ReadVariableOpЂ%batch_normalization_1/AssignMovingAvgЂ4batch_normalization_1/AssignMovingAvg/ReadVariableOpЂ'batch_normalization_1/AssignMovingAvg_1Ђ6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpЂ.batch_normalization_1/batchnorm/ReadVariableOpЂ2batch_normalization_1/batchnorm/mul/ReadVariableOpЂmul/ReadVariableOpЂmul_1/ReadVariableOpЂmul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ~
4batch_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Е
"batch_normalization_1/moments/meanMeanBiasAdd:output:0=batch_normalization_1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(
*batch_normalization_1/moments/StopGradientStopGradient+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes

:Н
/batch_normalization_1/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:03batch_normalization_1/moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
8batch_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: р
&batch_normalization_1/moments/varianceMean3batch_normalization_1/moments/SquaredDifference:z:0Abatch_normalization_1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(
%batch_normalization_1/moments/SqueezeSqueeze+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 
'batch_normalization_1/moments/Squeeze_1Squeeze/batch_normalization_1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 p
+batch_normalization_1/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
з#<Ў
4batch_normalization_1/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0У
)batch_normalization_1/AssignMovingAvg/subSub<batch_normalization_1/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_1/moments/Squeeze:output:0*
T0*
_output_shapes
:К
)batch_normalization_1/AssignMovingAvg/mulMul-batch_normalization_1/AssignMovingAvg/sub:z:04batch_normalization_1/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:
%batch_normalization_1/AssignMovingAvgAssignSubVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource-batch_normalization_1/AssignMovingAvg/mul:z:05^batch_normalization_1/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0r
-batch_normalization_1/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
з#<В
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0Щ
+batch_normalization_1/AssignMovingAvg_1/subSub>batch_normalization_1/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_1/moments/Squeeze_1:output:0*
T0*
_output_shapes
:Р
+batch_normalization_1/AssignMovingAvg_1/mulMul/batch_normalization_1/AssignMovingAvg_1/sub:z:06batch_normalization_1/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:
'batch_normalization_1/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource/batch_normalization_1/AssignMovingAvg_1/mul:z:07^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Г
#batch_normalization_1/batchnorm/addAddV20batch_normalization_1/moments/Squeeze_1:output:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:Њ
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ж
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџЊ
%batch_normalization_1/batchnorm/mul_2Mul.batch_normalization_1/moments/Squeeze:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:Ђ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0В
#batch_normalization_1/batchnorm/subSub6batch_normalization_1/batchnorm/ReadVariableOp:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Д
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:џџџџџџџџџG
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
valueB: 
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
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
 Д
ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Y
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
 *o:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
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
:
add_2/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ќJ
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
 *  р@K
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
 *  ?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ќR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ќA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ќE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ќL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ќQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ќ\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ќ6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ќh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ќT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ќR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ќL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ќA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ќN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ќL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ќS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ќ\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ќL
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
 *  р@Q
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
 *  ?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?M
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
 *  ?J
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
 *  ?T
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
 *  ?Q
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
:џџџџџџџџџM
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:Ж
ReadVariableOp_2ReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:a
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
 *o:c
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
:џџџџџџџџџ^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:џџџџџџџџџa
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџЦ
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp&^batch_normalization_1/AssignMovingAvg5^batch_normalization_1/AssignMovingAvg/ReadVariableOp(^batch_normalization_1/AssignMovingAvg_17^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp3^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":џџџџџџџџџќ: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22,
add_2/ReadVariableOpadd_2/ReadVariableOp2N
%batch_normalization_1/AssignMovingAvg%batch_normalization_1/AssignMovingAvg2l
4batch_normalization_1/AssignMovingAvg/ReadVariableOp4batch_normalization_1/AssignMovingAvg/ReadVariableOp2R
'batch_normalization_1/AssignMovingAvg_1'batch_normalization_1/AssignMovingAvg_12p
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
є	
e
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678414

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >І
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџo
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџi
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџY
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
j
Ж
C__inference_dense1_layer_call_and_return_conditional_losses_8678188

inputs1
matmul_readvariableop_resource:	ќ-
biasadd_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:G
9batch_normalization_1_batchnorm_readvariableop_1_resource:G
9batch_normalization_1_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identityЂAssignAddVariableOpЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpЂReadVariableOpЂReadVariableOp_1Ђadd_2/ReadVariableOpЂ.batch_normalization_1/batchnorm/ReadVariableOpЂ0batch_normalization_1/batchnorm/ReadVariableOp_1Ђ0batch_normalization_1/batchnorm/ReadVariableOp_2Ђ2batch_normalization_1/batchnorm/mul/ReadVariableOpЂmul/ReadVariableOpЂmul_1/ReadVariableOpЂmul_3/ReadVariableOpЂsub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџЂ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Й
#batch_normalization_1/batchnorm/addAddV26batch_normalization_1/batchnorm/ReadVariableOp:value:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:Њ
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ж
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџІ
0batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0Д
%batch_normalization_1/batchnorm/mul_2Mul8batch_normalization_1/batchnorm/ReadVariableOp_1:value:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:І
0batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0Д
#batch_normalization_1/batchnorm/subSub8batch_normalization_1/batchnorm/ReadVariableOp_2:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Д
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:џџџџџџџџџG
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
valueB: 
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
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
 
ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Y
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
 *o:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
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
dtype0
sub/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
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
:
add_2/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ќJ
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
 *  р@K
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
 *  ?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ќR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ќA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ќE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ќL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ќQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ќ\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ќ6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ќh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ќT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ќR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ќL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ќA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ќN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ќL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ќS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ќ\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ќL
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
 *  р@Q
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
 *  ?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?M
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
 *  ?J
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
 *  ?T
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
 *  ?Q
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
:џџџџџџџџџf
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:џџџџџџџџџa
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџь
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp1^batch_normalization_1/batchnorm/ReadVariableOp_11^batch_normalization_1/batchnorm/ReadVariableOp_23^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":џџџџџџџџџќ: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12,
add_2/ReadVariableOpadd_2/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2d
0batch_normalization_1/batchnorm/ReadVariableOp_10batch_normalization_1/batchnorm/ReadVariableOp_12d
0batch_normalization_1/batchnorm/ReadVariableOp_20batch_normalization_1/batchnorm/ReadVariableOp_22h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
і 
`
D__inference_outputs_layer_call_and_return_conditional_losses_8680278

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
 *  AG
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
:џџџџџџџџџF
ReluReluinputs*
T0*'
_output_shapes
:џџџџџџџџџE
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџD
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџr
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџP
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:џџџџџџџџџ[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџI
NegNegtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџM
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџR
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџW
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:џџџџџџџџџd
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџP
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџT
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџQ
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџV
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџL
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџl
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџQ
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
щц
К
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679629

inputs6
conv_readvariableop_resource:8
%dense1_matmul_readvariableop_resource:	ќ4
&dense1_biasadd_readvariableop_resource:R
Ddense1_batch_normalization_1_assignmovingavg_readvariableop_resource:T
Fdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource:P
Bdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource:L
>dense1_batch_normalization_1_batchnorm_readvariableop_resource:-
#dense1_assignaddvariableop_resource:	 0
dense2_readvariableop_resource:
identityЂconv/ReadVariableOpЂconv/ReadVariableOp_1Ђconv/ReadVariableOp_2Ђdense1/AssignAddVariableOpЂdense1/BiasAdd/ReadVariableOpЂdense1/MatMul/ReadVariableOpЂdense1/ReadVariableOpЂdense1/ReadVariableOp_1Ђdense1/ReadVariableOp_2Ђdense1/add_2/ReadVariableOpЂ,dense1/batch_normalization_1/AssignMovingAvgЂ;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOpЂ.dense1/batch_normalization_1/AssignMovingAvg_1Ђ=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOpЂ5dense1/batch_normalization_1/batchnorm/ReadVariableOpЂ9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpЂdense1/mul/ReadVariableOpЂdense1/mul_1/ReadVariableOpЂdense1/mul_3/ReadVariableOpЂdense2/ReadVariableOpЂdense2/ReadVariableOp_1Ђdense2/ReadVariableOp_2C
reshape/ShapeShapeinputs*
T0*
_output_shapes
:e
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: g
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:g
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:љ
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskY
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :б
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:|
reshape/ReshapeReshapeinputsreshape/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџO

conv/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @O

conv/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AZ
conv/PowPowconv/Pow/x:output:0conv/Pow/y:output:0*
T0*
_output_shapes
: Q
conv/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
conv/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@`

conv/Pow_1Powconv/Pow_1/x:output:0conv/Pow_1/y:output:0*
T0*
_output_shapes
: x
conv/ReadVariableOpReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0k
conv/mulMulconv/ReadVariableOp:value:0conv/Pow:z:0*
T0*&
_output_shapes
:f
conv/truedivRealDivconv/mul:z:0conv/Pow_1:z:0*
T0*&
_output_shapes
:R
conv/NegNegconv/truediv:z:0*
T0*&
_output_shapes
:V

conv/RoundRoundconv/truediv:z:0*
T0*&
_output_shapes
:`
conv/addAddV2conv/Neg:y:0conv/Round:y:0*
T0*&
_output_shapes
:`
conv/StopGradientStopGradientconv/add:z:0*
T0*&
_output_shapes
:r

conv/add_1AddV2conv/truediv:z:0conv/StopGradient:output:0*
T0*&
_output_shapes
:@

conv/Neg_1Negconv/Pow:z:0*
T0*
_output_shapes
: Q
conv/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?[

conv/add_2AddV2conv/Neg_1:y:0conv/add_2/y:output:0*
T0*
_output_shapes
: Q
conv/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y

conv/mul_1Mulconv/mul_1/x:output:0conv/add_2:z:0*
T0*
_output_shapes
: O

conv/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?S
conv/subSubconv/Pow:z:0conv/sub/y:output:0*
T0*
_output_shapes
: t
conv/clip_by_value/MinimumMinimumconv/add_1:z:0conv/sub:z:0*
T0*&
_output_shapes
:~
conv/clip_by_valueMaximumconv/clip_by_value/Minimum:z:0conv/mul_1:z:0*
T0*&
_output_shapes
:j

conv/mul_2Mulconv/Pow_1:z:0conv/clip_by_value:z:0*
T0*&
_output_shapes
:h
conv/truediv_1RealDivconv/mul_2:z:0conv/Pow:z:0*
T0*&
_output_shapes
:Q
conv/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?m

conv/mul_3Mulconv/mul_3/x:output:0conv/truediv_1:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_1ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0a

conv/Neg_2Negconv/ReadVariableOp_1:value:0*
T0*&
_output_shapes
:d

conv/add_3AddV2conv/Neg_2:y:0conv/mul_3:z:0*
T0*&
_output_shapes
:Q
conv/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i

conv/mul_4Mulconv/mul_4/x:output:0conv/add_3:z:0*
T0*&
_output_shapes
:d
conv/StopGradient_1StopGradientconv/mul_4:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_2ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0

conv/add_4AddV2conv/ReadVariableOp_2:value:0conv/StopGradient_1:output:0*
T0*&
_output_shapes
:Ї
conv/convolutionConv2Dreshape/Reshape:output:0conv/add_4:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingVALID*
strides
M
relu0/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu0/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu0/PowPowrelu0/Pow/x:output:0relu0/Pow/y:output:0*
T0*
_output_shapes
: Q

relu0/CastCastrelu0/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu0/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu0/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu0/Pow_1Powrelu0/Pow_1/x:output:0relu0/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu0/Cast_1Castrelu0/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu0/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu0/Cast_2Castrelu0/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu0/subSubrelu0/Cast_2:y:0relu0/sub/y:output:0*
T0*
_output_shapes
: X
relu0/Pow_2Powrelu0/Const:output:0relu0/sub:z:0*
T0*
_output_shapes
: V
relu0/sub_1Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: 
relu0/LessEqual	LessEqualconv/convolution:output:0relu0/sub_1:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	g

relu0/ReluReluconv/convolution:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	^
relu0/ones_like/ShapeShapeconv/convolution:output:0*
T0*
_output_shapes
:Z
relu0/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
relu0/ones_likeFillrelu0/ones_like/Shape:output:0relu0/ones_like/Const:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	V
relu0/sub_2Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: u
	relu0/mulMulrelu0/ones_like:output:0relu0/sub_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
relu0/SelectV2SelectV2relu0/LessEqual:z:0relu0/Relu:activations:0relu0/mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	w
relu0/mul_1Mulconv/convolution:output:0relu0/Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	u
relu0/truedivRealDivrelu0/mul_1:z:0relu0/Cast_1:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	]
	relu0/NegNegrelu0/truediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	a
relu0/RoundRoundrelu0/truediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	l
	relu0/addAddV2relu0/Neg:y:0relu0/Round:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	k
relu0/StopGradientStopGradientrelu0/add:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	~
relu0/add_1AddV2relu0/truediv:z:0relu0/StopGradient:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	u
relu0/truediv_1RealDivrelu0/add_1:z:0relu0/Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	V
relu0/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
relu0/truediv_2RealDivrelu0/truediv_2/x:output:0relu0/Cast:y:0*
T0*
_output_shapes
: R
relu0/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?`
relu0/sub_3Subrelu0/sub_3/x:output:0relu0/truediv_2:z:0*
T0*
_output_shapes
: 
relu0/clip_by_value/MinimumMinimumrelu0/truediv_1:z:0relu0/sub_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	Z
relu0/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
relu0/clip_by_valueMaximumrelu0/clip_by_value/Minimum:z:0relu0/clip_by_value/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	w
relu0/mul_2Mulrelu0/Cast_1:y:0relu0/clip_by_value:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	e
relu0/Neg_1Negrelu0/SelectV2:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	p
relu0/add_2AddV2relu0/Neg_1:y:0relu0/mul_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	R
relu0/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?u
relu0/mul_3Mulrelu0/mul_3/x:output:0relu0/add_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	o
relu0/StopGradient_1StopGradientrelu0/mul_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
relu0/add_3AddV2relu0/SelectV2:output:0relu0/StopGradient_1:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџќ   v
flatten/ReshapeReshaperelu0/add_3:z:0flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ\
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dropout_1/dropout/MulMulflatten/Reshape:output:0 dropout_1/dropout/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ_
dropout_1/dropout/ShapeShapeflatten/Reshape:output:0*
T0*
_output_shapes
:Ё
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ*
dtype0e
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9у=Х
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ
dropout_1/dropout/CastCast"dropout_1/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:џџџџџџџџџќ
dropout_1/dropout/Mul_1Muldropout_1/dropout/Mul:z:0dropout_1/dropout/Cast:y:0*
T0*(
_output_shapes
:џџџџџџџџџќO
dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0
dense1/MatMulMatMuldropout_1/dropout/Mul_1:z:0$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
;dense1/batch_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ъ
)dense1/batch_normalization_1/moments/meanMeandense1/BiasAdd:output:0Ddense1/batch_normalization_1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(
1dense1/batch_normalization_1/moments/StopGradientStopGradient2dense1/batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes

:в
6dense1/batch_normalization_1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0:dense1/batch_normalization_1/moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
?dense1/batch_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ѕ
-dense1/batch_normalization_1/moments/varianceMean:dense1/batch_normalization_1/moments/SquaredDifference:z:0Hdense1/batch_normalization_1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Ї
,dense1/batch_normalization_1/moments/SqueezeSqueeze2dense1/batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 ­
.dense1/batch_normalization_1/moments/Squeeze_1Squeeze6dense1/batch_normalization_1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 w
2dense1/batch_normalization_1/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
з#<М
;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOpReadVariableOpDdense1_batch_normalization_1_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0и
0dense1/batch_normalization_1/AssignMovingAvg/subSubCdense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp:value:05dense1/batch_normalization_1/moments/Squeeze:output:0*
T0*
_output_shapes
:Я
0dense1/batch_normalization_1/AssignMovingAvg/mulMul4dense1/batch_normalization_1/AssignMovingAvg/sub:z:0;dense1/batch_normalization_1/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
: 
,dense1/batch_normalization_1/AssignMovingAvgAssignSubVariableOpDdense1_batch_normalization_1_assignmovingavg_readvariableop_resource4dense1/batch_normalization_1/AssignMovingAvg/mul:z:0<^dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0y
4dense1/batch_normalization_1/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
з#<Р
=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOpReadVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0о
2dense1/batch_normalization_1/AssignMovingAvg_1/subSubEdense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp:value:07dense1/batch_normalization_1/moments/Squeeze_1:output:0*
T0*
_output_shapes
:е
2dense1/batch_normalization_1/AssignMovingAvg_1/mulMul6dense1/batch_normalization_1/AssignMovingAvg_1/sub:z:0=dense1/batch_normalization_1/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:Ј
.dense1/batch_normalization_1/AssignMovingAvg_1AssignSubVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource6dense1/batch_normalization_1/AssignMovingAvg_1/mul:z:0>^dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0q
,dense1/batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Ш
*dense1/batch_normalization_1/batchnorm/addAddV27dense1/batch_normalization_1/moments/Squeeze_1:output:05dense1/batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:
,dense1/batch_normalization_1/batchnorm/RsqrtRsqrt.dense1/batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:И
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ы
*dense1/batch_normalization_1/batchnorm/mulMul0dense1/batch_normalization_1/batchnorm/Rsqrt:y:0Adense1/batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ў
,dense1/batch_normalization_1/batchnorm/mul_1Muldense1/BiasAdd:output:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџП
,dense1/batch_normalization_1/batchnorm/mul_2Mul5dense1/batch_normalization_1/moments/Squeeze:output:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:А
5dense1/batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0Ч
*dense1/batch_normalization_1/batchnorm/subSub=dense1/batch_normalization_1/batchnorm/ReadVariableOp:value:00dense1/batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Щ
,dense1/batch_normalization_1/batchnorm/add_1AddV20dense1/batch_normalization_1/batchnorm/mul_1:z:0.dense1/batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:џџџџџџџџџN
dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R
dense1/AssignAddVariableOpAssignAddVariableOp#dense1_assignaddvariableop_resourcedense1/Const:output:0*
_output_shapes
 *
dtype0	o
%dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
dense1/moments/meanMeandense1/BiasAdd:output:0.dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(r
dense1/moments/StopGradientStopGradientdense1/moments/mean:output:0*
T0*
_output_shapes

:І
 dense1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0$dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџs
)dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Г
dense1/moments/varianceMean$dense1/moments/SquaredDifference:z:02dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims({
dense1/moments/SqueezeSqueezedense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 
dense1/moments/Squeeze_1Squeeze dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Щ
dense1/ReadVariableOpReadVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource/^dense1/batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0Q
dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:n

dense1/addAddV2dense1/ReadVariableOp:value:0dense1/add/y:output:0*
T0*
_output_shapes
:J
dense1/RsqrtRsqrtdense1/add:z:0*
T0*
_output_shapes
:S
dense1/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:v
dense1/add_1AddV2!dense1/moments/Squeeze_1:output:0dense1/add_1/y:output:0*
T0*
_output_shapes
:N
dense1/Rsqrt_1Rsqrtdense1/add_1:z:0*
T0*
_output_shapes
:
dense1/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0k

dense1/mulMuldense1/Rsqrt:y:0!dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
dense1/mul_1/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0q
dense1/mul_1Muldense1/Rsqrt_1:y:0#dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:z
dense1/ReadVariableOp_1ReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0x

dense1/subSubdense1/ReadVariableOp_1:value:0dense1/moments/Squeeze:output:0*
T0*
_output_shapes
:Z
dense1/mul_2Muldense1/mul_1:z:0dense1/sub:z:0*
T0*
_output_shapes
:
dense1/add_2/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0q
dense1/add_2AddV2dense1/mul_2:z:0#dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:
dense1/mul_3/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0r
dense1/mul_3Muldense1/mul:z:0#dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ќQ
dense1/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense1/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  р@`

dense1/PowPowdense1/Pow/x:output:0dense1/Pow/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
dense1/Pow_1Powdense1/Pow_1/x:output:0dense1/Pow_1/y:output:0*
T0*
_output_shapes
: _
dense1/mul_4Muldense1/mul_3:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ќg
dense1/truedivRealDivdense1/mul_4:z:0dense1/Pow_1:z:0*
T0*
_output_shapes
:	ќO

dense1/NegNegdense1/truediv:z:0*
T0*
_output_shapes
:	ќS
dense1/RoundRounddense1/truediv:z:0*
T0*
_output_shapes
:	ќa
dense1/add_3AddV2dense1/Neg:y:0dense1/Round:y:0*
T0*
_output_shapes
:	ќ_
dense1/StopGradientStopGradientdense1/add_3:z:0*
T0*
_output_shapes
:	ќq
dense1/add_4AddV2dense1/truediv:z:0dense1/StopGradient:output:0*
T0*
_output_shapes
:	ќD
dense1/Neg_1Negdense1/Pow:z:0*
T0*
_output_shapes
: S
dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?a
dense1/add_5AddV2dense1/Neg_1:y:0dense1/add_5/y:output:0*
T0*
_output_shapes
: S
dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
dense1/mul_5Muldense1/mul_5/x:output:0dense1/add_5:z:0*
T0*
_output_shapes
: S
dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?]
dense1/sub_1Subdense1/Pow:z:0dense1/sub_1/y:output:0*
T0*
_output_shapes
: u
dense1/clip_by_value/MinimumMinimumdense1/add_4:z:0dense1/sub_1:z:0*
T0*
_output_shapes
:	ќ}
dense1/clip_by_valueMaximum dense1/clip_by_value/Minimum:z:0dense1/mul_5:z:0*
T0*
_output_shapes
:	ќi
dense1/mul_6Muldense1/Pow_1:z:0dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ќg
dense1/truediv_1RealDivdense1/mul_6:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ќS
dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?l
dense1/mul_7Muldense1/mul_7/x:output:0dense1/truediv_1:z:0*
T0*
_output_shapes
:	ќO
dense1/Neg_2Negdense1/mul_3:z:0*
T0*
_output_shapes
:	ќc
dense1/add_6AddV2dense1/Neg_2:y:0dense1/mul_7:z:0*
T0*
_output_shapes
:	ќS
dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?h
dense1/mul_8Muldense1/mul_8/x:output:0dense1/add_6:z:0*
T0*
_output_shapes
:	ќa
dense1/StopGradient_1StopGradientdense1/mul_8:z:0*
T0*
_output_shapes
:	ќq
dense1/add_7AddV2dense1/mul_3:z:0dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ќS
dense1/Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  р@f
dense1/Pow_2Powdense1/Pow_2/x:output:0dense1/Pow_2/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense1/Pow_3Powdense1/Pow_3/x:output:0dense1/Pow_3/y:output:0*
T0*
_output_shapes
: \
dense1/mul_9Muldense1/add_2:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:d
dense1/truediv_2RealDivdense1/mul_9:z:0dense1/Pow_3:z:0*
T0*
_output_shapes
:N
dense1/Neg_3Negdense1/truediv_2:z:0*
T0*
_output_shapes
:R
dense1/Round_1Rounddense1/truediv_2:z:0*
T0*
_output_shapes
:`
dense1/add_8AddV2dense1/Neg_3:y:0dense1/Round_1:y:0*
T0*
_output_shapes
:\
dense1/StopGradient_2StopGradientdense1/add_8:z:0*
T0*
_output_shapes
:p
dense1/add_9AddV2dense1/truediv_2:z:0dense1/StopGradient_2:output:0*
T0*
_output_shapes
:F
dense1/Neg_4Negdense1/Pow_2:z:0*
T0*
_output_shapes
: T
dense1/add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?c
dense1/add_10AddV2dense1/Neg_4:y:0dense1/add_10/y:output:0*
T0*
_output_shapes
: T
dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?b
dense1/mul_10Muldense1/mul_10/x:output:0dense1/add_10:z:0*
T0*
_output_shapes
: S
dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
dense1/sub_2Subdense1/Pow_2:z:0dense1/sub_2/y:output:0*
T0*
_output_shapes
: r
dense1/clip_by_value_1/MinimumMinimumdense1/add_9:z:0dense1/sub_2:z:0*
T0*
_output_shapes
:}
dense1/clip_by_value_1Maximum"dense1/clip_by_value_1/Minimum:z:0dense1/mul_10:z:0*
T0*
_output_shapes
:g
dense1/mul_11Muldense1/Pow_3:z:0dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:e
dense1/truediv_3RealDivdense1/mul_11:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:T
dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
dense1/mul_12Muldense1/mul_12/x:output:0dense1/truediv_3:z:0*
T0*
_output_shapes
:J
dense1/Neg_5Negdense1/add_2:z:0*
T0*
_output_shapes
:`
dense1/add_11AddV2dense1/Neg_5:y:0dense1/mul_12:z:0*
T0*
_output_shapes
:T
dense1/mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
dense1/mul_13Muldense1/mul_13/x:output:0dense1/add_11:z:0*
T0*
_output_shapes
:]
dense1/StopGradient_3StopGradientdense1/mul_13:z:0*
T0*
_output_shapes
:m
dense1/add_12AddV2dense1/add_2:z:0dense1/StopGradient_3:output:0*
T0*
_output_shapes
:z
dense1/MatMul_1MatMuldropout_1/dropout/Mul_1:z:0dense1/add_7:z:0*
T0*'
_output_shapes
:џџџџџџџџџT
dense1/add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:x
dense1/add_13AddV2!dense1/moments/Squeeze_1:output:0dense1/add_13/y:output:0*
T0*
_output_shapes
:O
dense1/Rsqrt_2Rsqrtdense1/add_13:z:0*
T0*
_output_shapes
:Ы
dense1/ReadVariableOp_2ReadVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource/^dense1/batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0T
dense1/add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:v
dense1/add_14AddV2dense1/ReadVariableOp_2:value:0dense1/add_14/y:output:0*
T0*
_output_shapes
:K
dense1/SqrtSqrtdense1/add_14:z:0*
T0*
_output_shapes
:T
dense1/add_15/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:x
dense1/add_15AddV2!dense1/moments/Squeeze_1:output:0dense1/add_15/y:output:0*
T0*
_output_shapes
:O
dense1/Rsqrt_3Rsqrtdense1/add_15:z:0*
T0*
_output_shapes
:^
dense1/mul_14Muldense1/Sqrt:y:0dense1/Rsqrt_3:y:0*
T0*
_output_shapes
:t
dense1/Mul_15Muldense1/MatMul_1:product:0dense1/mul_14:z:0*
T0*'
_output_shapes
:џџџџџџџџџs
dense1/BiasAdd_1BiasAdddense1/Mul_15:z:0dense1/add_12:z:0*
T0*'
_output_shapes
:џџџџџџџџџM
relu1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu1/PowPowrelu1/Pow/x:output:0relu1/Pow/y:output:0*
T0*
_output_shapes
: Q

relu1/CastCastrelu1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu1/Pow_1Powrelu1/Pow_1/x:output:0relu1/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu1/Cast_1Castrelu1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu1/Cast_2Castrelu1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu1/subSubrelu1/Cast_2:y:0relu1/sub/y:output:0*
T0*
_output_shapes
: X
relu1/Pow_2Powrelu1/Const:output:0relu1/sub:z:0*
T0*
_output_shapes
: V
relu1/sub_1Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: z
relu1/LessEqual	LessEqualdense1/BiasAdd_1:output:0relu1/sub_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџ_

relu1/ReluReludense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџ^
relu1/ones_like/ShapeShapedense1/BiasAdd_1:output:0*
T0*
_output_shapes
:Z
relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
relu1/ones_likeFillrelu1/ones_like/Shape:output:0relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџV
relu1/sub_2Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: m
	relu1/mulMulrelu1/ones_like:output:0relu1/sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
relu1/SelectV2SelectV2relu1/LessEqual:z:0relu1/Relu:activations:0relu1/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџo
relu1/mul_1Muldense1/BiasAdd_1:output:0relu1/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџm
relu1/truedivRealDivrelu1/mul_1:z:0relu1/Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџU
	relu1/NegNegrelu1/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџY
relu1/RoundRoundrelu1/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџd
	relu1/addAddV2relu1/Neg:y:0relu1/Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџc
relu1/StopGradientStopGradientrelu1/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџv
relu1/add_1AddV2relu1/truediv:z:0relu1/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџm
relu1/truediv_1RealDivrelu1/add_1:z:0relu1/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџV
relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
relu1/truediv_2RealDivrelu1/truediv_2/x:output:0relu1/Cast:y:0*
T0*
_output_shapes
: R
relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?`
relu1/sub_3Subrelu1/sub_3/x:output:0relu1/truediv_2:z:0*
T0*
_output_shapes
: ~
relu1/clip_by_value/MinimumMinimumrelu1/truediv_1:z:0relu1/sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџZ
relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
relu1/clip_by_valueMaximumrelu1/clip_by_value/Minimum:z:0relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџo
relu1/mul_2Mulrelu1/Cast_1:y:0relu1/clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџ]
relu1/Neg_1Negrelu1/SelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџh
relu1/add_2AddV2relu1/Neg_1:y:0relu1/mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџR
relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?m
relu1/mul_3Mulrelu1/mul_3/x:output:0relu1/add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџg
relu1/StopGradient_1StopGradientrelu1/mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ~
relu1/add_3AddV2relu1/SelectV2:output:0relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџ\
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I?
dropout_2/dropout/MulMulrelu1/add_3:z:0 dropout_2/dropout/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџV
dropout_2/dropout/ShapeShaperelu1/add_3:z:0*
T0*
_output_shapes
: 
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
dtype0e
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ф
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
dropout_2/dropout/CastCast"dropout_2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџ
dropout_2/dropout/Mul_1Muldropout_2/dropout/Mul:z:0dropout_2/dropout/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџQ
dense2/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense2/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0A`

dense2/PowPowdense2/Pow/x:output:0dense2/Pow/y:output:0*
T0*
_output_shapes
: S
dense2/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense2/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense2/Pow_1Powdense2/Pow_1/x:output:0dense2/Pow_1/y:output:0*
T0*
_output_shapes
: t
dense2/ReadVariableOpReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0i

dense2/mulMuldense2/ReadVariableOp:value:0dense2/Pow:z:0*
T0*
_output_shapes

:d
dense2/truedivRealDivdense2/mul:z:0dense2/Pow_1:z:0*
T0*
_output_shapes

:N

dense2/NegNegdense2/truediv:z:0*
T0*
_output_shapes

:R
dense2/RoundRounddense2/truediv:z:0*
T0*
_output_shapes

:^

dense2/addAddV2dense2/Neg:y:0dense2/Round:y:0*
T0*
_output_shapes

:\
dense2/StopGradientStopGradientdense2/add:z:0*
T0*
_output_shapes

:p
dense2/add_1AddV2dense2/truediv:z:0dense2/StopGradient:output:0*
T0*
_output_shapes

:D
dense2/Neg_1Negdense2/Pow:z:0*
T0*
_output_shapes
: S
dense2/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?a
dense2/add_2AddV2dense2/Neg_1:y:0dense2/add_2/y:output:0*
T0*
_output_shapes
: S
dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
dense2/mul_1Muldense2/mul_1/x:output:0dense2/add_2:z:0*
T0*
_output_shapes
: Q
dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y

dense2/subSubdense2/Pow:z:0dense2/sub/y:output:0*
T0*
_output_shapes
: r
dense2/clip_by_value/MinimumMinimumdense2/add_1:z:0dense2/sub:z:0*
T0*
_output_shapes

:|
dense2/clip_by_valueMaximum dense2/clip_by_value/Minimum:z:0dense2/mul_1:z:0*
T0*
_output_shapes

:h
dense2/mul_2Muldense2/Pow_1:z:0dense2/clip_by_value:z:0*
T0*
_output_shapes

:f
dense2/truediv_1RealDivdense2/mul_2:z:0dense2/Pow:z:0*
T0*
_output_shapes

:S
dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
dense2/mul_3Muldense2/mul_3/x:output:0dense2/truediv_1:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_1ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0]
dense2/Neg_2Negdense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:b
dense2/add_3AddV2dense2/Neg_2:y:0dense2/mul_3:z:0*
T0*
_output_shapes

:S
dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
dense2/mul_4Muldense2/mul_4/x:output:0dense2/add_3:z:0*
T0*
_output_shapes

:`
dense2/StopGradient_1StopGradientdense2/mul_4:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_2ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0
dense2/add_4AddV2dense2/ReadVariableOp_2:value:0dense2/StopGradient_1:output:0*
T0*
_output_shapes

:x
dense2/MatMulMatMuldropout_2/dropout/Mul_1:z:0dense2/add_4:z:0*
T0*'
_output_shapes
:џџџџџџџџџO
outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :O
outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :c
outputs/PowPowoutputs/Pow/x:output:0outputs/Pow/y:output:0*
T0*
_output_shapes
: U
outputs/CastCastoutputs/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Q
outputs/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Q
outputs/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :i
outputs/Pow_1Powoutputs/Pow_1/x:output:0outputs/Pow_1/y:output:0*
T0*
_output_shapes
: Y
outputs/Cast_1Castoutputs/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @R
outputs/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :a
outputs/Cast_2Castoutputs/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  A_
outputs/subSuboutputs/Cast_2:y:0outputs/sub/y:output:0*
T0*
_output_shapes
: ^
outputs/Pow_2Powoutputs/Const:output:0outputs/sub:z:0*
T0*
_output_shapes
: \
outputs/sub_1Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: |
outputs/LessEqual	LessEqualdense2/MatMul:product:0outputs/sub_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџ_
outputs/ReluReludense2/MatMul:product:0*
T0*'
_output_shapes
:џџџџџџџџџ^
outputs/ones_like/ShapeShapedense2/MatMul:product:0*
T0*
_output_shapes
:\
outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
outputs/ones_likeFill outputs/ones_like/Shape:output:0 outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџ\
outputs/sub_2Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: s
outputs/mulMuloutputs/ones_like:output:0outputs/sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
outputs/SelectV2SelectV2outputs/LessEqual:z:0outputs/Relu:activations:0outputs/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџq
outputs/mul_1Muldense2/MatMul:product:0outputs/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџs
outputs/truedivRealDivoutputs/mul_1:z:0outputs/Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџY
outputs/NegNegoutputs/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ]
outputs/RoundRoundoutputs/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџj
outputs/addAddV2outputs/Neg:y:0outputs/Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџg
outputs/StopGradientStopGradientoutputs/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ|
outputs/add_1AddV2outputs/truediv:z:0outputs/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџs
outputs/truediv_1RealDivoutputs/add_1:z:0outputs/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџX
outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?m
outputs/truediv_2RealDivoutputs/truediv_2/x:output:0outputs/Cast:y:0*
T0*
_output_shapes
: T
outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
outputs/sub_3Suboutputs/sub_3/x:output:0outputs/truediv_2:z:0*
T0*
_output_shapes
: 
outputs/clip_by_value/MinimumMinimumoutputs/truediv_1:z:0outputs/sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ\
outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
outputs/clip_by_valueMaximum!outputs/clip_by_value/Minimum:z:0 outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџu
outputs/mul_2Muloutputs/Cast_1:y:0outputs/clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџa
outputs/Neg_1Negoutputs/SelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџn
outputs/add_2AddV2outputs/Neg_1:y:0outputs/mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџT
outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?s
outputs/mul_3Muloutputs/mul_3/x:output:0outputs/add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџk
outputs/StopGradient_1StopGradientoutputs/mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
outputs/add_3AddV2outputs/SelectV2:output:0outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџ`
IdentityIdentityoutputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџШ
NoOpNoOp^conv/ReadVariableOp^conv/ReadVariableOp_1^conv/ReadVariableOp_2^dense1/AssignAddVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp^dense1/ReadVariableOp^dense1/ReadVariableOp_1^dense1/ReadVariableOp_2^dense1/add_2/ReadVariableOp-^dense1/batch_normalization_1/AssignMovingAvg<^dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp/^dense1/batch_normalization_1/AssignMovingAvg_1>^dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp6^dense1/batch_normalization_1/batchnorm/ReadVariableOp:^dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp^dense1/mul/ReadVariableOp^dense1/mul_1/ReadVariableOp^dense1/mul_3/ReadVariableOp^dense2/ReadVariableOp^dense2/ReadVariableOp_1^dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 2*
conv/ReadVariableOpconv/ReadVariableOp2.
conv/ReadVariableOp_1conv/ReadVariableOp_12.
conv/ReadVariableOp_2conv/ReadVariableOp_228
dense1/AssignAddVariableOpdense1/AssignAddVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp2.
dense1/ReadVariableOpdense1/ReadVariableOp22
dense1/ReadVariableOp_1dense1/ReadVariableOp_122
dense1/ReadVariableOp_2dense1/ReadVariableOp_22:
dense1/add_2/ReadVariableOpdense1/add_2/ReadVariableOp2\
,dense1/batch_normalization_1/AssignMovingAvg,dense1/batch_normalization_1/AssignMovingAvg2z
;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp2`
.dense1/batch_normalization_1/AssignMovingAvg_1.dense1/batch_normalization_1/AssignMovingAvg_12~
=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp2n
5dense1/batch_normalization_1/batchnorm/ReadVariableOp5dense1/batch_normalization_1/batchnorm/ReadVariableOp2v
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp26
dense1/mul/ReadVariableOpdense1/mul/ReadVariableOp2:
dense1/mul_1/ReadVariableOpdense1/mul_1/ReadVariableOp2:
dense1/mul_3/ReadVariableOpdense1/mul_3/ReadVariableOp2.
dense2/ReadVariableOpdense2/ReadVariableOp22
dense2/ReadVariableOp_1dense2/ReadVariableOp_122
dense2/ReadVariableOp_2dense2/ReadVariableOp_2:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Ц
`
D__inference_flatten_layer_call_and_return_conditional_losses_8678057

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџќ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџќY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
Ё
G
+__inference_dropout_2_layer_call_fn_8680154

inputs
identityБ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678260`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
я	
е
+__inference_cicada-v2_layer_call_fn_8678380
inputs_!
unknown:
	unknown_0:	ќ
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityЂStatefulPartitionedCallЖ
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678359o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:џџџџџџџџџќ
!
_user_specified_name	inputs_
й
d
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678260

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:џџџџџџџџџ[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:џџџџџџџџџ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ѓ
d
+__inference_dropout_2_layer_call_fn_8680159

inputs
identityЂStatefulPartitionedCallС
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678414o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Е"
^
B__inference_relu0_layer_call_and_return_conditional_losses_8679750

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
:џџџџџџџџџ	N
ReluReluinputs*
T0*/
_output_shapes
:џџџџџџџџџ	E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
mulMulones_like:output:0	sub_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	z
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	X
mul_1MulinputsCast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	c
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	Q
NegNegtruediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	U
RoundRoundtruediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	Z
addAddV2Neg:y:0	Round:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	_
StopGradientStopGradientadd:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	l
add_1AddV2truediv:z:0StopGradient:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	c
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: t
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	e
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	Y
Neg_1NegSelectV2:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	^
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?c
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	c
StopGradient_1StopGradient	mul_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	t
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	Y
IdentityIdentity	add_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
М

&__inference_conv_layer_call_fn_8679655

inputs!
unknown:
identityЂStatefulPartitionedCallб
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_8677996w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:џџџџџџџџџ: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

C
'__inference_relu1_layer_call_fn_8680100

inputs
identity­
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_8678253`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ј
в
7__inference_batch_normalization_1_layer_call_fn_8680304

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityЂStatefulPartitionedCallџ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *[
fVRT
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8677921o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
%
ы
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8677921

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identityЂAssignMovingAvgЂAssignMovingAvg/ReadVariableOpЂAssignMovingAvg_1Ђ AssignMovingAvg_1/ReadVariableOpЂbatchnorm/ReadVariableOpЂbatchnorm/mul/ReadVariableOph
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

:
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
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
з#<
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:Ќ
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
з#<
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:Д
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:q
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
:џџџџџџџџџh
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
:џџџџџџџџџb
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџъ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
і 
`
D__inference_outputs_layer_call_and_return_conditional_losses_8678356

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
 *  AG
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
:џџџџџџџџџF
ReluReluinputs*
T0*'
_output_shapes
:џџџџџџџџџE
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџD
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџr
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџP
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:џџџџџџџџџ[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџI
NegNegtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџM
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџR
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџW
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:џџџџџџџџџd
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџP
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџT
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџQ
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџV
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџL
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџl
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџQ
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
й
d
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680164

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:џџџџџџџџџ[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:џџџџџџџџџ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Э
`
D__inference_reshape_layer_call_and_return_conditional_losses_8679648

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
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
valueB:б
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
value	B :Љ
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
џ
Ф
C__inference_dense2_layer_call_and_return_conditional_losses_8678303

inputs)
readvariableop_resource:
identityЂReadVariableOpЂReadVariableOp_1ЂReadVariableOp_2J
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
 *  ?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?D
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
 *  ?V
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
 *  ?R
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
:џџџџџџџџџ_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ц
`
D__inference_flatten_layer_call_and_return_conditional_losses_8679761

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџќ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџќY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
э	
е
+__inference_cicada-v2_layer_call_fn_8678759
inputs_!
unknown:
	unknown_0:	ќ
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityЂStatefulPartitionedCallД
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*(
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678715o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:џџџџџџџџџќ
!
_user_specified_name	inputs_
ќ	
e
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679788

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџќC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9у=Ї
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:џџџџџџџџџќp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:џџџџџџџџџќj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:џџџџџџџџџќZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:џџџџџџџџџќ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
иВ
Ш

F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679245

inputs6
conv_readvariableop_resource:8
%dense1_matmul_readvariableop_resource:	ќ4
&dense1_biasadd_readvariableop_resource:L
>dense1_batch_normalization_1_batchnorm_readvariableop_resource:P
Bdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource:N
@dense1_batch_normalization_1_batchnorm_readvariableop_1_resource:N
@dense1_batch_normalization_1_batchnorm_readvariableop_2_resource:-
#dense1_assignaddvariableop_resource:	 0
dense2_readvariableop_resource:
identityЂconv/ReadVariableOpЂconv/ReadVariableOp_1Ђconv/ReadVariableOp_2Ђdense1/AssignAddVariableOpЂdense1/BiasAdd/ReadVariableOpЂdense1/MatMul/ReadVariableOpЂdense1/ReadVariableOpЂdense1/ReadVariableOp_1Ђdense1/add_2/ReadVariableOpЂ5dense1/batch_normalization_1/batchnorm/ReadVariableOpЂ7dense1/batch_normalization_1/batchnorm/ReadVariableOp_1Ђ7dense1/batch_normalization_1/batchnorm/ReadVariableOp_2Ђ9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpЂdense1/mul/ReadVariableOpЂdense1/mul_1/ReadVariableOpЂdense1/mul_3/ReadVariableOpЂdense1/sub/ReadVariableOpЂdense2/ReadVariableOpЂdense2/ReadVariableOp_1Ђdense2/ReadVariableOp_2C
reshape/ShapeShapeinputs*
T0*
_output_shapes
:e
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: g
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:g
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:љ
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskY
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :б
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:|
reshape/ReshapeReshapeinputsreshape/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџO

conv/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @O

conv/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AZ
conv/PowPowconv/Pow/x:output:0conv/Pow/y:output:0*
T0*
_output_shapes
: Q
conv/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
conv/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@`

conv/Pow_1Powconv/Pow_1/x:output:0conv/Pow_1/y:output:0*
T0*
_output_shapes
: x
conv/ReadVariableOpReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0k
conv/mulMulconv/ReadVariableOp:value:0conv/Pow:z:0*
T0*&
_output_shapes
:f
conv/truedivRealDivconv/mul:z:0conv/Pow_1:z:0*
T0*&
_output_shapes
:R
conv/NegNegconv/truediv:z:0*
T0*&
_output_shapes
:V

conv/RoundRoundconv/truediv:z:0*
T0*&
_output_shapes
:`
conv/addAddV2conv/Neg:y:0conv/Round:y:0*
T0*&
_output_shapes
:`
conv/StopGradientStopGradientconv/add:z:0*
T0*&
_output_shapes
:r

conv/add_1AddV2conv/truediv:z:0conv/StopGradient:output:0*
T0*&
_output_shapes
:@

conv/Neg_1Negconv/Pow:z:0*
T0*
_output_shapes
: Q
conv/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?[

conv/add_2AddV2conv/Neg_1:y:0conv/add_2/y:output:0*
T0*
_output_shapes
: Q
conv/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y

conv/mul_1Mulconv/mul_1/x:output:0conv/add_2:z:0*
T0*
_output_shapes
: O

conv/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?S
conv/subSubconv/Pow:z:0conv/sub/y:output:0*
T0*
_output_shapes
: t
conv/clip_by_value/MinimumMinimumconv/add_1:z:0conv/sub:z:0*
T0*&
_output_shapes
:~
conv/clip_by_valueMaximumconv/clip_by_value/Minimum:z:0conv/mul_1:z:0*
T0*&
_output_shapes
:j

conv/mul_2Mulconv/Pow_1:z:0conv/clip_by_value:z:0*
T0*&
_output_shapes
:h
conv/truediv_1RealDivconv/mul_2:z:0conv/Pow:z:0*
T0*&
_output_shapes
:Q
conv/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?m

conv/mul_3Mulconv/mul_3/x:output:0conv/truediv_1:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_1ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0a

conv/Neg_2Negconv/ReadVariableOp_1:value:0*
T0*&
_output_shapes
:d

conv/add_3AddV2conv/Neg_2:y:0conv/mul_3:z:0*
T0*&
_output_shapes
:Q
conv/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i

conv/mul_4Mulconv/mul_4/x:output:0conv/add_3:z:0*
T0*&
_output_shapes
:d
conv/StopGradient_1StopGradientconv/mul_4:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_2ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0

conv/add_4AddV2conv/ReadVariableOp_2:value:0conv/StopGradient_1:output:0*
T0*&
_output_shapes
:Ї
conv/convolutionConv2Dreshape/Reshape:output:0conv/add_4:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingVALID*
strides
M
relu0/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu0/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu0/PowPowrelu0/Pow/x:output:0relu0/Pow/y:output:0*
T0*
_output_shapes
: Q

relu0/CastCastrelu0/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu0/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu0/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu0/Pow_1Powrelu0/Pow_1/x:output:0relu0/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu0/Cast_1Castrelu0/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu0/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu0/Cast_2Castrelu0/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu0/subSubrelu0/Cast_2:y:0relu0/sub/y:output:0*
T0*
_output_shapes
: X
relu0/Pow_2Powrelu0/Const:output:0relu0/sub:z:0*
T0*
_output_shapes
: V
relu0/sub_1Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: 
relu0/LessEqual	LessEqualconv/convolution:output:0relu0/sub_1:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	g

relu0/ReluReluconv/convolution:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	^
relu0/ones_like/ShapeShapeconv/convolution:output:0*
T0*
_output_shapes
:Z
relu0/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
relu0/ones_likeFillrelu0/ones_like/Shape:output:0relu0/ones_like/Const:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	V
relu0/sub_2Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: u
	relu0/mulMulrelu0/ones_like:output:0relu0/sub_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
relu0/SelectV2SelectV2relu0/LessEqual:z:0relu0/Relu:activations:0relu0/mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	w
relu0/mul_1Mulconv/convolution:output:0relu0/Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	u
relu0/truedivRealDivrelu0/mul_1:z:0relu0/Cast_1:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	]
	relu0/NegNegrelu0/truediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	a
relu0/RoundRoundrelu0/truediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	l
	relu0/addAddV2relu0/Neg:y:0relu0/Round:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	k
relu0/StopGradientStopGradientrelu0/add:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	~
relu0/add_1AddV2relu0/truediv:z:0relu0/StopGradient:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	u
relu0/truediv_1RealDivrelu0/add_1:z:0relu0/Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	V
relu0/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
relu0/truediv_2RealDivrelu0/truediv_2/x:output:0relu0/Cast:y:0*
T0*
_output_shapes
: R
relu0/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?`
relu0/sub_3Subrelu0/sub_3/x:output:0relu0/truediv_2:z:0*
T0*
_output_shapes
: 
relu0/clip_by_value/MinimumMinimumrelu0/truediv_1:z:0relu0/sub_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	Z
relu0/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
relu0/clip_by_valueMaximumrelu0/clip_by_value/Minimum:z:0relu0/clip_by_value/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	w
relu0/mul_2Mulrelu0/Cast_1:y:0relu0/clip_by_value:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	e
relu0/Neg_1Negrelu0/SelectV2:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	p
relu0/add_2AddV2relu0/Neg_1:y:0relu0/mul_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	R
relu0/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?u
relu0/mul_3Mulrelu0/mul_3/x:output:0relu0/add_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	o
relu0/StopGradient_1StopGradientrelu0/mul_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
relu0/add_3AddV2relu0/SelectV2:output:0relu0/StopGradient_1:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџќ   v
flatten/ReshapeReshaperelu0/add_3:z:0flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџќk
dropout_1/IdentityIdentityflatten/Reshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџќO
dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z 
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0
dense1/MatMulMatMuldropout_1/Identity:output:0$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџА
5dense1/batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0q
,dense1/batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Ю
*dense1/batch_normalization_1/batchnorm/addAddV2=dense1/batch_normalization_1/batchnorm/ReadVariableOp:value:05dense1/batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:
,dense1/batch_normalization_1/batchnorm/RsqrtRsqrt.dense1/batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:И
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ы
*dense1/batch_normalization_1/batchnorm/mulMul0dense1/batch_normalization_1/batchnorm/Rsqrt:y:0Adense1/batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ў
,dense1/batch_normalization_1/batchnorm/mul_1Muldense1/BiasAdd:output:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџД
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0Щ
,dense1/batch_normalization_1/batchnorm/mul_2Mul?dense1/batch_normalization_1/batchnorm/ReadVariableOp_1:value:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:Д
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0Щ
*dense1/batch_normalization_1/batchnorm/subSub?dense1/batch_normalization_1/batchnorm/ReadVariableOp_2:value:00dense1/batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Щ
,dense1/batch_normalization_1/batchnorm/add_1AddV20dense1/batch_normalization_1/batchnorm/mul_1:z:0.dense1/batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:џџџџџџџџџN
dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
dense1/AssignAddVariableOpAssignAddVariableOp#dense1_assignaddvariableop_resourcedense1/Const:output:0*
_output_shapes
 *
dtype0	o
%dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
dense1/moments/meanMeandense1/BiasAdd:output:0.dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(r
dense1/moments/StopGradientStopGradientdense1/moments/mean:output:0*
T0*
_output_shapes

:І
 dense1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0$dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџs
)dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Г
dense1/moments/varianceMean$dense1/moments/SquaredDifference:z:02dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims({
dense1/moments/SqueezeSqueezedense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 
dense1/moments/Squeeze_1Squeeze dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 
dense1/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0Q
dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:n

dense1/addAddV2dense1/ReadVariableOp:value:0dense1/add/y:output:0*
T0*
_output_shapes
:J
dense1/RsqrtRsqrtdense1/add:z:0*
T0*
_output_shapes
:S
dense1/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:v
dense1/add_1AddV2!dense1/moments/Squeeze_1:output:0dense1/add_1/y:output:0*
T0*
_output_shapes
:N
dense1/Rsqrt_1Rsqrtdense1/add_1:z:0*
T0*
_output_shapes
:
dense1/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0k

dense1/mulMuldense1/Rsqrt:y:0!dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
dense1/mul_1/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0q
dense1/mul_1Muldense1/Rsqrt_1:y:0#dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:z
dense1/ReadVariableOp_1ReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense1/sub/ReadVariableOpReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0z

dense1/subSubdense1/ReadVariableOp_1:value:0!dense1/sub/ReadVariableOp:value:0*
T0*
_output_shapes
:X
dense1/mul_2Muldense1/mul:z:0dense1/sub:z:0*
T0*
_output_shapes
:
dense1/add_2/ReadVariableOpReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0q
dense1/add_2AddV2dense1/mul_2:z:0#dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:
dense1/mul_3/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0r
dense1/mul_3Muldense1/mul:z:0#dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ќQ
dense1/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense1/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  р@`

dense1/PowPowdense1/Pow/x:output:0dense1/Pow/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
dense1/Pow_1Powdense1/Pow_1/x:output:0dense1/Pow_1/y:output:0*
T0*
_output_shapes
: _
dense1/mul_4Muldense1/mul_3:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ќg
dense1/truedivRealDivdense1/mul_4:z:0dense1/Pow_1:z:0*
T0*
_output_shapes
:	ќO

dense1/NegNegdense1/truediv:z:0*
T0*
_output_shapes
:	ќS
dense1/RoundRounddense1/truediv:z:0*
T0*
_output_shapes
:	ќa
dense1/add_3AddV2dense1/Neg:y:0dense1/Round:y:0*
T0*
_output_shapes
:	ќ_
dense1/StopGradientStopGradientdense1/add_3:z:0*
T0*
_output_shapes
:	ќq
dense1/add_4AddV2dense1/truediv:z:0dense1/StopGradient:output:0*
T0*
_output_shapes
:	ќD
dense1/Neg_1Negdense1/Pow:z:0*
T0*
_output_shapes
: S
dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?a
dense1/add_5AddV2dense1/Neg_1:y:0dense1/add_5/y:output:0*
T0*
_output_shapes
: S
dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
dense1/mul_5Muldense1/mul_5/x:output:0dense1/add_5:z:0*
T0*
_output_shapes
: S
dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?]
dense1/sub_1Subdense1/Pow:z:0dense1/sub_1/y:output:0*
T0*
_output_shapes
: u
dense1/clip_by_value/MinimumMinimumdense1/add_4:z:0dense1/sub_1:z:0*
T0*
_output_shapes
:	ќ}
dense1/clip_by_valueMaximum dense1/clip_by_value/Minimum:z:0dense1/mul_5:z:0*
T0*
_output_shapes
:	ќi
dense1/mul_6Muldense1/Pow_1:z:0dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ќg
dense1/truediv_1RealDivdense1/mul_6:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ќS
dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?l
dense1/mul_7Muldense1/mul_7/x:output:0dense1/truediv_1:z:0*
T0*
_output_shapes
:	ќO
dense1/Neg_2Negdense1/mul_3:z:0*
T0*
_output_shapes
:	ќc
dense1/add_6AddV2dense1/Neg_2:y:0dense1/mul_7:z:0*
T0*
_output_shapes
:	ќS
dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?h
dense1/mul_8Muldense1/mul_8/x:output:0dense1/add_6:z:0*
T0*
_output_shapes
:	ќa
dense1/StopGradient_1StopGradientdense1/mul_8:z:0*
T0*
_output_shapes
:	ќq
dense1/add_7AddV2dense1/mul_3:z:0dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ќS
dense1/Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  р@f
dense1/Pow_2Powdense1/Pow_2/x:output:0dense1/Pow_2/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense1/Pow_3Powdense1/Pow_3/x:output:0dense1/Pow_3/y:output:0*
T0*
_output_shapes
: \
dense1/mul_9Muldense1/add_2:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:d
dense1/truediv_2RealDivdense1/mul_9:z:0dense1/Pow_3:z:0*
T0*
_output_shapes
:N
dense1/Neg_3Negdense1/truediv_2:z:0*
T0*
_output_shapes
:R
dense1/Round_1Rounddense1/truediv_2:z:0*
T0*
_output_shapes
:`
dense1/add_8AddV2dense1/Neg_3:y:0dense1/Round_1:y:0*
T0*
_output_shapes
:\
dense1/StopGradient_2StopGradientdense1/add_8:z:0*
T0*
_output_shapes
:p
dense1/add_9AddV2dense1/truediv_2:z:0dense1/StopGradient_2:output:0*
T0*
_output_shapes
:F
dense1/Neg_4Negdense1/Pow_2:z:0*
T0*
_output_shapes
: T
dense1/add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?c
dense1/add_10AddV2dense1/Neg_4:y:0dense1/add_10/y:output:0*
T0*
_output_shapes
: T
dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?b
dense1/mul_10Muldense1/mul_10/x:output:0dense1/add_10:z:0*
T0*
_output_shapes
: S
dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
dense1/sub_2Subdense1/Pow_2:z:0dense1/sub_2/y:output:0*
T0*
_output_shapes
: r
dense1/clip_by_value_1/MinimumMinimumdense1/add_9:z:0dense1/sub_2:z:0*
T0*
_output_shapes
:}
dense1/clip_by_value_1Maximum"dense1/clip_by_value_1/Minimum:z:0dense1/mul_10:z:0*
T0*
_output_shapes
:g
dense1/mul_11Muldense1/Pow_3:z:0dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:e
dense1/truediv_3RealDivdense1/mul_11:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:T
dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?i
dense1/mul_12Muldense1/mul_12/x:output:0dense1/truediv_3:z:0*
T0*
_output_shapes
:J
dense1/Neg_5Negdense1/add_2:z:0*
T0*
_output_shapes
:`
dense1/add_11AddV2dense1/Neg_5:y:0dense1/mul_12:z:0*
T0*
_output_shapes
:T
dense1/mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
dense1/mul_13Muldense1/mul_13/x:output:0dense1/add_11:z:0*
T0*
_output_shapes
:]
dense1/StopGradient_3StopGradientdense1/mul_13:z:0*
T0*
_output_shapes
:m
dense1/add_12AddV2dense1/add_2:z:0dense1/StopGradient_3:output:0*
T0*
_output_shapes
:z
dense1/MatMul_1MatMuldropout_1/Identity:output:0dense1/add_7:z:0*
T0*'
_output_shapes
:џџџџџџџџџ{
dense1/BiasAdd_1BiasAdddense1/MatMul_1:product:0dense1/add_12:z:0*
T0*'
_output_shapes
:џџџџџџџџџM
relu1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu1/PowPowrelu1/Pow/x:output:0relu1/Pow/y:output:0*
T0*
_output_shapes
: Q

relu1/CastCastrelu1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu1/Pow_1Powrelu1/Pow_1/x:output:0relu1/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu1/Cast_1Castrelu1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu1/Cast_2Castrelu1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu1/subSubrelu1/Cast_2:y:0relu1/sub/y:output:0*
T0*
_output_shapes
: X
relu1/Pow_2Powrelu1/Const:output:0relu1/sub:z:0*
T0*
_output_shapes
: V
relu1/sub_1Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: z
relu1/LessEqual	LessEqualdense1/BiasAdd_1:output:0relu1/sub_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџ_

relu1/ReluReludense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџ^
relu1/ones_like/ShapeShapedense1/BiasAdd_1:output:0*
T0*
_output_shapes
:Z
relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
relu1/ones_likeFillrelu1/ones_like/Shape:output:0relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџV
relu1/sub_2Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: m
	relu1/mulMulrelu1/ones_like:output:0relu1/sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
relu1/SelectV2SelectV2relu1/LessEqual:z:0relu1/Relu:activations:0relu1/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџo
relu1/mul_1Muldense1/BiasAdd_1:output:0relu1/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџm
relu1/truedivRealDivrelu1/mul_1:z:0relu1/Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџU
	relu1/NegNegrelu1/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџY
relu1/RoundRoundrelu1/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџd
	relu1/addAddV2relu1/Neg:y:0relu1/Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџc
relu1/StopGradientStopGradientrelu1/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџv
relu1/add_1AddV2relu1/truediv:z:0relu1/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџm
relu1/truediv_1RealDivrelu1/add_1:z:0relu1/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџV
relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
relu1/truediv_2RealDivrelu1/truediv_2/x:output:0relu1/Cast:y:0*
T0*
_output_shapes
: R
relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?`
relu1/sub_3Subrelu1/sub_3/x:output:0relu1/truediv_2:z:0*
T0*
_output_shapes
: ~
relu1/clip_by_value/MinimumMinimumrelu1/truediv_1:z:0relu1/sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџZ
relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
relu1/clip_by_valueMaximumrelu1/clip_by_value/Minimum:z:0relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџo
relu1/mul_2Mulrelu1/Cast_1:y:0relu1/clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџ]
relu1/Neg_1Negrelu1/SelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџh
relu1/add_2AddV2relu1/Neg_1:y:0relu1/mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџR
relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?m
relu1/mul_3Mulrelu1/mul_3/x:output:0relu1/add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџg
relu1/StopGradient_1StopGradientrelu1/mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ~
relu1/add_3AddV2relu1/SelectV2:output:0relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџa
dropout_2/IdentityIdentityrelu1/add_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџQ
dense2/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense2/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0A`

dense2/PowPowdense2/Pow/x:output:0dense2/Pow/y:output:0*
T0*
_output_shapes
: S
dense2/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense2/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense2/Pow_1Powdense2/Pow_1/x:output:0dense2/Pow_1/y:output:0*
T0*
_output_shapes
: t
dense2/ReadVariableOpReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0i

dense2/mulMuldense2/ReadVariableOp:value:0dense2/Pow:z:0*
T0*
_output_shapes

:d
dense2/truedivRealDivdense2/mul:z:0dense2/Pow_1:z:0*
T0*
_output_shapes

:N

dense2/NegNegdense2/truediv:z:0*
T0*
_output_shapes

:R
dense2/RoundRounddense2/truediv:z:0*
T0*
_output_shapes

:^

dense2/addAddV2dense2/Neg:y:0dense2/Round:y:0*
T0*
_output_shapes

:\
dense2/StopGradientStopGradientdense2/add:z:0*
T0*
_output_shapes

:p
dense2/add_1AddV2dense2/truediv:z:0dense2/StopGradient:output:0*
T0*
_output_shapes

:D
dense2/Neg_1Negdense2/Pow:z:0*
T0*
_output_shapes
: S
dense2/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?a
dense2/add_2AddV2dense2/Neg_1:y:0dense2/add_2/y:output:0*
T0*
_output_shapes
: S
dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?_
dense2/mul_1Muldense2/mul_1/x:output:0dense2/add_2:z:0*
T0*
_output_shapes
: Q
dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Y

dense2/subSubdense2/Pow:z:0dense2/sub/y:output:0*
T0*
_output_shapes
: r
dense2/clip_by_value/MinimumMinimumdense2/add_1:z:0dense2/sub:z:0*
T0*
_output_shapes

:|
dense2/clip_by_valueMaximum dense2/clip_by_value/Minimum:z:0dense2/mul_1:z:0*
T0*
_output_shapes

:h
dense2/mul_2Muldense2/Pow_1:z:0dense2/clip_by_value:z:0*
T0*
_output_shapes

:f
dense2/truediv_1RealDivdense2/mul_2:z:0dense2/Pow:z:0*
T0*
_output_shapes

:S
dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
dense2/mul_3Muldense2/mul_3/x:output:0dense2/truediv_1:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_1ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0]
dense2/Neg_2Negdense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:b
dense2/add_3AddV2dense2/Neg_2:y:0dense2/mul_3:z:0*
T0*
_output_shapes

:S
dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
dense2/mul_4Muldense2/mul_4/x:output:0dense2/add_3:z:0*
T0*
_output_shapes

:`
dense2/StopGradient_1StopGradientdense2/mul_4:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_2ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0
dense2/add_4AddV2dense2/ReadVariableOp_2:value:0dense2/StopGradient_1:output:0*
T0*
_output_shapes

:x
dense2/MatMulMatMuldropout_2/Identity:output:0dense2/add_4:z:0*
T0*'
_output_shapes
:џџџџџџџџџO
outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :O
outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :c
outputs/PowPowoutputs/Pow/x:output:0outputs/Pow/y:output:0*
T0*
_output_shapes
: U
outputs/CastCastoutputs/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Q
outputs/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Q
outputs/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :i
outputs/Pow_1Powoutputs/Pow_1/x:output:0outputs/Pow_1/y:output:0*
T0*
_output_shapes
: Y
outputs/Cast_1Castoutputs/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @R
outputs/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :a
outputs/Cast_2Castoutputs/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  A_
outputs/subSuboutputs/Cast_2:y:0outputs/sub/y:output:0*
T0*
_output_shapes
: ^
outputs/Pow_2Powoutputs/Const:output:0outputs/sub:z:0*
T0*
_output_shapes
: \
outputs/sub_1Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: |
outputs/LessEqual	LessEqualdense2/MatMul:product:0outputs/sub_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџ_
outputs/ReluReludense2/MatMul:product:0*
T0*'
_output_shapes
:џџџџџџџџџ^
outputs/ones_like/ShapeShapedense2/MatMul:product:0*
T0*
_output_shapes
:\
outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
outputs/ones_likeFill outputs/ones_like/Shape:output:0 outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџ\
outputs/sub_2Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: s
outputs/mulMuloutputs/ones_like:output:0outputs/sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
outputs/SelectV2SelectV2outputs/LessEqual:z:0outputs/Relu:activations:0outputs/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџq
outputs/mul_1Muldense2/MatMul:product:0outputs/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџs
outputs/truedivRealDivoutputs/mul_1:z:0outputs/Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџY
outputs/NegNegoutputs/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ]
outputs/RoundRoundoutputs/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџj
outputs/addAddV2outputs/Neg:y:0outputs/Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџg
outputs/StopGradientStopGradientoutputs/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ|
outputs/add_1AddV2outputs/truediv:z:0outputs/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџs
outputs/truediv_1RealDivoutputs/add_1:z:0outputs/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџX
outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?m
outputs/truediv_2RealDivoutputs/truediv_2/x:output:0outputs/Cast:y:0*
T0*
_output_shapes
: T
outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
outputs/sub_3Suboutputs/sub_3/x:output:0outputs/truediv_2:z:0*
T0*
_output_shapes
: 
outputs/clip_by_value/MinimumMinimumoutputs/truediv_1:z:0outputs/sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ\
outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
outputs/clip_by_valueMaximum!outputs/clip_by_value/Minimum:z:0 outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџu
outputs/mul_2Muloutputs/Cast_1:y:0outputs/clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџa
outputs/Neg_1Negoutputs/SelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџn
outputs/add_2AddV2outputs/Neg_1:y:0outputs/mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџT
outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?s
outputs/mul_3Muloutputs/mul_3/x:output:0outputs/add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџk
outputs/StopGradient_1StopGradientoutputs/mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
outputs/add_3AddV2outputs/SelectV2:output:0outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџ`
IdentityIdentityoutputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџр
NoOpNoOp^conv/ReadVariableOp^conv/ReadVariableOp_1^conv/ReadVariableOp_2^dense1/AssignAddVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp^dense1/ReadVariableOp^dense1/ReadVariableOp_1^dense1/add_2/ReadVariableOp6^dense1/batch_normalization_1/batchnorm/ReadVariableOp8^dense1/batch_normalization_1/batchnorm/ReadVariableOp_18^dense1/batch_normalization_1/batchnorm/ReadVariableOp_2:^dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp^dense1/mul/ReadVariableOp^dense1/mul_1/ReadVariableOp^dense1/mul_3/ReadVariableOp^dense1/sub/ReadVariableOp^dense2/ReadVariableOp^dense2/ReadVariableOp_1^dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 2*
conv/ReadVariableOpconv/ReadVariableOp2.
conv/ReadVariableOp_1conv/ReadVariableOp_12.
conv/ReadVariableOp_2conv/ReadVariableOp_228
dense1/AssignAddVariableOpdense1/AssignAddVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp2.
dense1/ReadVariableOpdense1/ReadVariableOp22
dense1/ReadVariableOp_1dense1/ReadVariableOp_12:
dense1/add_2/ReadVariableOpdense1/add_2/ReadVariableOp2n
5dense1/batch_normalization_1/batchnorm/ReadVariableOp5dense1/batch_normalization_1/batchnorm/ReadVariableOp2r
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_17dense1/batch_normalization_1/batchnorm/ReadVariableOp_12r
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_27dense1/batch_normalization_1/batchnorm/ReadVariableOp_22v
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp26
dense1/mul/ReadVariableOpdense1/mul/ReadVariableOp2:
dense1/mul_1/ReadVariableOpdense1/mul_1/ReadVariableOp2:
dense1/mul_3/ReadVariableOpdense1/mul_3/ReadVariableOp26
dense1/sub/ReadVariableOpdense1/sub/ReadVariableOp2.
dense2/ReadVariableOpdense2/ReadVariableOp22
dense2/ReadVariableOp_1dense2/ReadVariableOp_122
dense2/ReadVariableOp_2dense2/ReadVariableOp_2:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
%
ы
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680358

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identityЂAssignMovingAvgЂAssignMovingAvg/ReadVariableOpЂAssignMovingAvg_1Ђ AssignMovingAvg_1/ReadVariableOpЂbatchnorm/ReadVariableOpЂbatchnorm/mul/ReadVariableOph
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

:
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
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
з#<
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:Ќ
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
з#<
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:Д
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:q
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
:џџџџџџџџџh
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
:џџџџџџџџџb
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџъ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ќ	
e
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678629

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџќC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9у=Ї
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:џџџџџџџџџќp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:џџџџџџџџџќj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:џџџџџџџџџќZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:џџџџџџџџџќ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
їє
Ч
"__inference__wrapped_model_8677850
inputs_@
&cicada_v2_conv_readvariableop_resource:B
/cicada_v2_dense1_matmul_readvariableop_resource:	ќ>
0cicada_v2_dense1_biasadd_readvariableop_resource:V
Hcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_resource:Z
Lcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource:X
Jcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_1_resource:X
Jcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_2_resource:7
-cicada_v2_dense1_assignaddvariableop_resource:	 :
(cicada_v2_dense2_readvariableop_resource:
identityЂcicada-v2/conv/ReadVariableOpЂcicada-v2/conv/ReadVariableOp_1Ђcicada-v2/conv/ReadVariableOp_2Ђ$cicada-v2/dense1/AssignAddVariableOpЂ'cicada-v2/dense1/BiasAdd/ReadVariableOpЂ&cicada-v2/dense1/MatMul/ReadVariableOpЂcicada-v2/dense1/ReadVariableOpЂ!cicada-v2/dense1/ReadVariableOp_1Ђ%cicada-v2/dense1/add_2/ReadVariableOpЂ?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOpЂAcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1ЂAcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2ЂCcicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpЂ#cicada-v2/dense1/mul/ReadVariableOpЂ%cicada-v2/dense1/mul_1/ReadVariableOpЂ%cicada-v2/dense1/mul_3/ReadVariableOpЂ#cicada-v2/dense1/sub/ReadVariableOpЂcicada-v2/dense2/ReadVariableOpЂ!cicada-v2/dense2/ReadVariableOp_1Ђ!cicada-v2/dense2/ReadVariableOp_2N
cicada-v2/reshape/ShapeShapeinputs_*
T0*
_output_shapes
:o
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
valueB:Ћ
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
value	B :
cicada-v2/reshape/Reshape/shapePack(cicada-v2/reshape/strided_slice:output:0*cicada-v2/reshape/Reshape/shape/1:output:0*cicada-v2/reshape/Reshape/shape/2:output:0*cicada-v2/reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:
cicada-v2/reshape/ReshapeReshapeinputs_(cicada-v2/reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџY
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
: 
cicada-v2/conv/ReadVariableOpReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0
cicada-v2/conv/mulMul%cicada-v2/conv/ReadVariableOp:value:0cicada-v2/conv/Pow:z:0*
T0*&
_output_shapes
:
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
:
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
 *  ?y
cicada-v2/conv/add_2AddV2cicada-v2/conv/Neg_1:y:0cicada-v2/conv/add_2/y:output:0*
T0*
_output_shapes
: [
cicada-v2/conv/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?w
cicada-v2/conv/mul_1Mulcicada-v2/conv/mul_1/x:output:0cicada-v2/conv/add_2:z:0*
T0*
_output_shapes
: Y
cicada-v2/conv/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?q
cicada-v2/conv/subSubcicada-v2/conv/Pow:z:0cicada-v2/conv/sub/y:output:0*
T0*
_output_shapes
: 
$cicada-v2/conv/clip_by_value/MinimumMinimumcicada-v2/conv/add_1:z:0cicada-v2/conv/sub:z:0*
T0*&
_output_shapes
:
cicada-v2/conv/clip_by_valueMaximum(cicada-v2/conv/clip_by_value/Minimum:z:0cicada-v2/conv/mul_1:z:0*
T0*&
_output_shapes
:
cicada-v2/conv/mul_2Mulcicada-v2/conv/Pow_1:z:0 cicada-v2/conv/clip_by_value:z:0*
T0*&
_output_shapes
:
cicada-v2/conv/truediv_1RealDivcicada-v2/conv/mul_2:z:0cicada-v2/conv/Pow:z:0*
T0*&
_output_shapes
:[
cicada-v2/conv/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/conv/mul_3Mulcicada-v2/conv/mul_3/x:output:0cicada-v2/conv/truediv_1:z:0*
T0*&
_output_shapes
:
cicada-v2/conv/ReadVariableOp_1ReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0u
cicada-v2/conv/Neg_2Neg'cicada-v2/conv/ReadVariableOp_1:value:0*
T0*&
_output_shapes
:
cicada-v2/conv/add_3AddV2cicada-v2/conv/Neg_2:y:0cicada-v2/conv/mul_3:z:0*
T0*&
_output_shapes
:[
cicada-v2/conv/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/conv/mul_4Mulcicada-v2/conv/mul_4/x:output:0cicada-v2/conv/add_3:z:0*
T0*&
_output_shapes
:x
cicada-v2/conv/StopGradient_1StopGradientcicada-v2/conv/mul_4:z:0*
T0*&
_output_shapes
:
cicada-v2/conv/ReadVariableOp_2ReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0
cicada-v2/conv/add_4AddV2'cicada-v2/conv/ReadVariableOp_2:value:0&cicada-v2/conv/StopGradient_1:output:0*
T0*&
_output_shapes
:Х
cicada-v2/conv/convolutionConv2D"cicada-v2/reshape/Reshape:output:0cicada-v2/conv/add_4:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
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
value	B :
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
:  
cicada-v2/relu0/LessEqual	LessEqual#cicada-v2/conv/convolution:output:0cicada-v2/relu0/sub_1:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	{
cicada-v2/relu0/ReluRelu#cicada-v2/conv/convolution:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	r
cicada-v2/relu0/ones_like/ShapeShape#cicada-v2/conv/convolution:output:0*
T0*
_output_shapes
:d
cicada-v2/relu0/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Џ
cicada-v2/relu0/ones_likeFill(cicada-v2/relu0/ones_like/Shape:output:0(cicada-v2/relu0/ones_like/Const:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	t
cicada-v2/relu0/sub_2Subcicada-v2/relu0/Cast_1:y:0cicada-v2/relu0/Pow_2:z:0*
T0*
_output_shapes
: 
cicada-v2/relu0/mulMul"cicada-v2/relu0/ones_like:output:0cicada-v2/relu0/sub_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	К
cicada-v2/relu0/SelectV2SelectV2cicada-v2/relu0/LessEqual:z:0"cicada-v2/relu0/Relu:activations:0cicada-v2/relu0/mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/mul_1Mul#cicada-v2/conv/convolution:output:0cicada-v2/relu0/Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/truedivRealDivcicada-v2/relu0/mul_1:z:0cicada-v2/relu0/Cast_1:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	q
cicada-v2/relu0/NegNegcicada-v2/relu0/truediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	u
cicada-v2/relu0/RoundRoundcicada-v2/relu0/truediv:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/addAddV2cicada-v2/relu0/Neg:y:0cicada-v2/relu0/Round:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/StopGradientStopGradientcicada-v2/relu0/add:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/add_1AddV2cicada-v2/relu0/truediv:z:0%cicada-v2/relu0/StopGradient:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/truediv_1RealDivcicada-v2/relu0/add_1:z:0cicada-v2/relu0/Cast:y:0*
T0*/
_output_shapes
:џџџџџџџџџ	`
cicada-v2/relu0/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/relu0/truediv_2RealDiv$cicada-v2/relu0/truediv_2/x:output:0cicada-v2/relu0/Cast:y:0*
T0*
_output_shapes
: \
cicada-v2/relu0/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?~
cicada-v2/relu0/sub_3Sub cicada-v2/relu0/sub_3/x:output:0cicada-v2/relu0/truediv_2:z:0*
T0*
_output_shapes
: Є
%cicada-v2/relu0/clip_by_value/MinimumMinimumcicada-v2/relu0/truediv_1:z:0cicada-v2/relu0/sub_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	d
cicada-v2/relu0/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    З
cicada-v2/relu0/clip_by_valueMaximum)cicada-v2/relu0/clip_by_value/Minimum:z:0(cicada-v2/relu0/clip_by_value/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/mul_2Mulcicada-v2/relu0/Cast_1:y:0!cicada-v2/relu0/clip_by_value:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	y
cicada-v2/relu0/Neg_1Neg!cicada-v2/relu0/SelectV2:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/add_2AddV2cicada-v2/relu0/Neg_1:y:0cicada-v2/relu0/mul_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	\
cicada-v2/relu0/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/relu0/mul_3Mul cicada-v2/relu0/mul_3/x:output:0cicada-v2/relu0/add_2:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	
cicada-v2/relu0/StopGradient_1StopGradientcicada-v2/relu0/mul_3:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	Є
cicada-v2/relu0/add_3AddV2!cicada-v2/relu0/SelectV2:output:0'cicada-v2/relu0/StopGradient_1:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	h
cicada-v2/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџќ   
cicada-v2/flatten/ReshapeReshapecicada-v2/relu0/add_3:z:0 cicada-v2/flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ
cicada-v2/dropout_1/IdentityIdentity"cicada-v2/flatten/Reshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџќY
cicada-v2/dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z 
&cicada-v2/dense1/MatMul/ReadVariableOpReadVariableOp/cicada_v2_dense1_matmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0Њ
cicada-v2/dense1/MatMulMatMul%cicada-v2/dropout_1/Identity:output:0.cicada-v2/dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
'cicada-v2/dense1/BiasAdd/ReadVariableOpReadVariableOp0cicada_v2_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Љ
cicada-v2/dense1/BiasAddBiasAdd!cicada-v2/dense1/MatMul:product:0/cicada-v2/dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџФ
?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOpReadVariableOpHcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0{
6cicada-v2/dense1/batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:ь
4cicada-v2/dense1/batch_normalization_1/batchnorm/addAddV2Gcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp:value:0?cicada-v2/dense1/batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:
6cicada-v2/dense1/batch_normalization_1/batchnorm/RsqrtRsqrt8cicada-v2/dense1/batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:Ь
Ccicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0щ
4cicada-v2/dense1/batch_normalization_1/batchnorm/mulMul:cicada-v2/dense1/batch_normalization_1/batchnorm/Rsqrt:y:0Kcicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ь
6cicada-v2/dense1/batch_normalization_1/batchnorm/mul_1Mul!cicada-v2/dense1/BiasAdd:output:08cicada-v2/dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџШ
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0ч
6cicada-v2/dense1/batch_normalization_1/batchnorm/mul_2MulIcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1:value:08cicada-v2/dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:Ш
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0ч
4cicada-v2/dense1/batch_normalization_1/batchnorm/subSubIcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2:value:0:cicada-v2/dense1/batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:ч
6cicada-v2/dense1/batch_normalization_1/batchnorm/add_1AddV2:cicada-v2/dense1/batch_normalization_1/batchnorm/mul_1:z:08cicada-v2/dense1/batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:џџџџџџџџџX
cicada-v2/dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R Ў
$cicada-v2/dense1/AssignAddVariableOpAssignAddVariableOp-cicada_v2_dense1_assignaddvariableop_resourcecicada-v2/dense1/Const:output:0*
_output_shapes
 *
dtype0	y
/cicada-v2/dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: М
cicada-v2/dense1/moments/meanMean!cicada-v2/dense1/BiasAdd:output:08cicada-v2/dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(
%cicada-v2/dense1/moments/StopGradientStopGradient&cicada-v2/dense1/moments/mean:output:0*
T0*
_output_shapes

:Ф
*cicada-v2/dense1/moments/SquaredDifferenceSquaredDifference!cicada-v2/dense1/BiasAdd:output:0.cicada-v2/dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ}
3cicada-v2/dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: б
!cicada-v2/dense1/moments/varianceMean.cicada-v2/dense1/moments/SquaredDifference:z:0<cicada-v2/dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(
 cicada-v2/dense1/moments/SqueezeSqueeze&cicada-v2/dense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 
"cicada-v2/dense1/moments/Squeeze_1Squeeze*cicada-v2/dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Є
cicada-v2/dense1/ReadVariableOpReadVariableOpHcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0[
cicada-v2/dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:
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
 *o:
cicada-v2/dense1/add_1AddV2+cicada-v2/dense1/moments/Squeeze_1:output:0!cicada-v2/dense1/add_1/y:output:0*
T0*
_output_shapes
:b
cicada-v2/dense1/Rsqrt_1Rsqrtcicada-v2/dense1/add_1:z:0*
T0*
_output_shapes
:Ќ
#cicada-v2/dense1/mul/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0
cicada-v2/dense1/mulMulcicada-v2/dense1/Rsqrt:y:0+cicada-v2/dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ў
%cicada-v2/dense1/mul_1/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0
cicada-v2/dense1/mul_1Mulcicada-v2/dense1/Rsqrt_1:y:0-cicada-v2/dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:
!cicada-v2/dense1/ReadVariableOp_1ReadVariableOp0cicada_v2_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Њ
#cicada-v2/dense1/sub/ReadVariableOpReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0
cicada-v2/dense1/subSub)cicada-v2/dense1/ReadVariableOp_1:value:0+cicada-v2/dense1/sub/ReadVariableOp:value:0*
T0*
_output_shapes
:v
cicada-v2/dense1/mul_2Mulcicada-v2/dense1/mul:z:0cicada-v2/dense1/sub:z:0*
T0*
_output_shapes
:Ќ
%cicada-v2/dense1/add_2/ReadVariableOpReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0
cicada-v2/dense1/add_2AddV2cicada-v2/dense1/mul_2:z:0-cicada-v2/dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:
%cicada-v2/dense1/mul_3/ReadVariableOpReadVariableOp/cicada_v2_dense1_matmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0
cicada-v2/dense1/mul_3Mulcicada-v2/dense1/mul:z:0-cicada-v2/dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ќ[
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
 *  р@~
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
 *  ?
cicada-v2/dense1/Pow_1Pow!cicada-v2/dense1/Pow_1/x:output:0!cicada-v2/dense1/Pow_1/y:output:0*
T0*
_output_shapes
: }
cicada-v2/dense1/mul_4Mulcicada-v2/dense1/mul_3:z:0cicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/truedivRealDivcicada-v2/dense1/mul_4:z:0cicada-v2/dense1/Pow_1:z:0*
T0*
_output_shapes
:	ќc
cicada-v2/dense1/NegNegcicada-v2/dense1/truediv:z:0*
T0*
_output_shapes
:	ќg
cicada-v2/dense1/RoundRoundcicada-v2/dense1/truediv:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/add_3AddV2cicada-v2/dense1/Neg:y:0cicada-v2/dense1/Round:y:0*
T0*
_output_shapes
:	ќs
cicada-v2/dense1/StopGradientStopGradientcicada-v2/dense1/add_3:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/add_4AddV2cicada-v2/dense1/truediv:z:0&cicada-v2/dense1/StopGradient:output:0*
T0*
_output_shapes
:	ќX
cicada-v2/dense1/Neg_1Negcicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/dense1/add_5AddV2cicada-v2/dense1/Neg_1:y:0!cicada-v2/dense1/add_5/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?}
cicada-v2/dense1/mul_5Mul!cicada-v2/dense1/mul_5/x:output:0cicada-v2/dense1/add_5:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?{
cicada-v2/dense1/sub_1Subcicada-v2/dense1/Pow:z:0!cicada-v2/dense1/sub_1/y:output:0*
T0*
_output_shapes
: 
&cicada-v2/dense1/clip_by_value/MinimumMinimumcicada-v2/dense1/add_4:z:0cicada-v2/dense1/sub_1:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/clip_by_valueMaximum*cicada-v2/dense1/clip_by_value/Minimum:z:0cicada-v2/dense1/mul_5:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/mul_6Mulcicada-v2/dense1/Pow_1:z:0"cicada-v2/dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/truediv_1RealDivcicada-v2/dense1/mul_6:z:0cicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
:	ќ]
cicada-v2/dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/dense1/mul_7Mul!cicada-v2/dense1/mul_7/x:output:0cicada-v2/dense1/truediv_1:z:0*
T0*
_output_shapes
:	ќc
cicada-v2/dense1/Neg_2Negcicada-v2/dense1/mul_3:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/add_6AddV2cicada-v2/dense1/Neg_2:y:0cicada-v2/dense1/mul_7:z:0*
T0*
_output_shapes
:	ќ]
cicada-v2/dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/dense1/mul_8Mul!cicada-v2/dense1/mul_8/x:output:0cicada-v2/dense1/add_6:z:0*
T0*
_output_shapes
:	ќu
cicada-v2/dense1/StopGradient_1StopGradientcicada-v2/dense1/mul_8:z:0*
T0*
_output_shapes
:	ќ
cicada-v2/dense1/add_7AddV2cicada-v2/dense1/mul_3:z:0(cicada-v2/dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ќ]
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
 *  р@
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
 *  @@
cicada-v2/dense1/Pow_3Pow!cicada-v2/dense1/Pow_3/x:output:0!cicada-v2/dense1/Pow_3/y:output:0*
T0*
_output_shapes
: z
cicada-v2/dense1/mul_9Mulcicada-v2/dense1/add_2:z:0cicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
:
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
:
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
 *  ?
cicada-v2/dense1/add_10AddV2cicada-v2/dense1/Neg_4:y:0"cicada-v2/dense1/add_10/y:output:0*
T0*
_output_shapes
: ^
cicada-v2/dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/dense1/mul_10Mul"cicada-v2/dense1/mul_10/x:output:0cicada-v2/dense1/add_10:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?}
cicada-v2/dense1/sub_2Subcicada-v2/dense1/Pow_2:z:0!cicada-v2/dense1/sub_2/y:output:0*
T0*
_output_shapes
: 
(cicada-v2/dense1/clip_by_value_1/MinimumMinimumcicada-v2/dense1/add_9:z:0cicada-v2/dense1/sub_2:z:0*
T0*
_output_shapes
:
 cicada-v2/dense1/clip_by_value_1Maximum,cicada-v2/dense1/clip_by_value_1/Minimum:z:0cicada-v2/dense1/mul_10:z:0*
T0*
_output_shapes
:
cicada-v2/dense1/mul_11Mulcicada-v2/dense1/Pow_3:z:0$cicada-v2/dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:
cicada-v2/dense1/truediv_3RealDivcicada-v2/dense1/mul_11:z:0cicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
:^
cicada-v2/dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
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
 *  ?
cicada-v2/dense1/mul_13Mul"cicada-v2/dense1/mul_13/x:output:0cicada-v2/dense1/add_11:z:0*
T0*
_output_shapes
:q
cicada-v2/dense1/StopGradient_3StopGradientcicada-v2/dense1/mul_13:z:0*
T0*
_output_shapes
:
cicada-v2/dense1/add_12AddV2cicada-v2/dense1/add_2:z:0(cicada-v2/dense1/StopGradient_3:output:0*
T0*
_output_shapes
:
cicada-v2/dense1/MatMul_1MatMul%cicada-v2/dropout_1/Identity:output:0cicada-v2/dense1/add_7:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/dense1/BiasAdd_1BiasAdd#cicada-v2/dense1/MatMul_1:product:0cicada-v2/dense1/add_12:z:0*
T0*'
_output_shapes
:џџџџџџџџџW
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
value	B :
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
: 
cicada-v2/relu1/LessEqual	LessEqual#cicada-v2/dense1/BiasAdd_1:output:0cicada-v2/relu1/sub_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџs
cicada-v2/relu1/ReluRelu#cicada-v2/dense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџr
cicada-v2/relu1/ones_like/ShapeShape#cicada-v2/dense1/BiasAdd_1:output:0*
T0*
_output_shapes
:d
cicada-v2/relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Ї
cicada-v2/relu1/ones_likeFill(cicada-v2/relu1/ones_like/Shape:output:0(cicada-v2/relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџt
cicada-v2/relu1/sub_2Subcicada-v2/relu1/Cast_1:y:0cicada-v2/relu1/Pow_2:z:0*
T0*
_output_shapes
: 
cicada-v2/relu1/mulMul"cicada-v2/relu1/ones_like:output:0cicada-v2/relu1/sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџВ
cicada-v2/relu1/SelectV2SelectV2cicada-v2/relu1/LessEqual:z:0"cicada-v2/relu1/Relu:activations:0cicada-v2/relu1/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/mul_1Mul#cicada-v2/dense1/BiasAdd_1:output:0cicada-v2/relu1/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/truedivRealDivcicada-v2/relu1/mul_1:z:0cicada-v2/relu1/Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџi
cicada-v2/relu1/NegNegcicada-v2/relu1/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџm
cicada-v2/relu1/RoundRoundcicada-v2/relu1/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/addAddV2cicada-v2/relu1/Neg:y:0cicada-v2/relu1/Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџw
cicada-v2/relu1/StopGradientStopGradientcicada-v2/relu1/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/add_1AddV2cicada-v2/relu1/truediv:z:0%cicada-v2/relu1/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/truediv_1RealDivcicada-v2/relu1/add_1:z:0cicada-v2/relu1/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџ`
cicada-v2/relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/relu1/truediv_2RealDiv$cicada-v2/relu1/truediv_2/x:output:0cicada-v2/relu1/Cast:y:0*
T0*
_output_shapes
: \
cicada-v2/relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?~
cicada-v2/relu1/sub_3Sub cicada-v2/relu1/sub_3/x:output:0cicada-v2/relu1/truediv_2:z:0*
T0*
_output_shapes
: 
%cicada-v2/relu1/clip_by_value/MinimumMinimumcicada-v2/relu1/truediv_1:z:0cicada-v2/relu1/sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџd
cicada-v2/relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Џ
cicada-v2/relu1/clip_by_valueMaximum)cicada-v2/relu1/clip_by_value/Minimum:z:0(cicada-v2/relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/mul_2Mulcicada-v2/relu1/Cast_1:y:0!cicada-v2/relu1/clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџq
cicada-v2/relu1/Neg_1Neg!cicada-v2/relu1/SelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/add_2AddV2cicada-v2/relu1/Neg_1:y:0cicada-v2/relu1/mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ\
cicada-v2/relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/relu1/mul_3Mul cicada-v2/relu1/mul_3/x:output:0cicada-v2/relu1/add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ{
cicada-v2/relu1/StopGradient_1StopGradientcicada-v2/relu1/mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/relu1/add_3AddV2!cicada-v2/relu1/SelectV2:output:0'cicada-v2/relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџu
cicada-v2/dropout_2/IdentityIdentitycicada-v2/relu1/add_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџ[
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
 *  @@
cicada-v2/dense2/Pow_1Pow!cicada-v2/dense2/Pow_1/x:output:0!cicada-v2/dense2/Pow_1/y:output:0*
T0*
_output_shapes
: 
cicada-v2/dense2/ReadVariableOpReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0
cicada-v2/dense2/mulMul'cicada-v2/dense2/ReadVariableOp:value:0cicada-v2/dense2/Pow:z:0*
T0*
_output_shapes

:
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

:
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
 *  ?
cicada-v2/dense2/add_2AddV2cicada-v2/dense2/Neg_1:y:0!cicada-v2/dense2/add_2/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?}
cicada-v2/dense2/mul_1Mul!cicada-v2/dense2/mul_1/x:output:0cicada-v2/dense2/add_2:z:0*
T0*
_output_shapes
: [
cicada-v2/dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?w
cicada-v2/dense2/subSubcicada-v2/dense2/Pow:z:0cicada-v2/dense2/sub/y:output:0*
T0*
_output_shapes
: 
&cicada-v2/dense2/clip_by_value/MinimumMinimumcicada-v2/dense2/add_1:z:0cicada-v2/dense2/sub:z:0*
T0*
_output_shapes

:
cicada-v2/dense2/clip_by_valueMaximum*cicada-v2/dense2/clip_by_value/Minimum:z:0cicada-v2/dense2/mul_1:z:0*
T0*
_output_shapes

:
cicada-v2/dense2/mul_2Mulcicada-v2/dense2/Pow_1:z:0"cicada-v2/dense2/clip_by_value:z:0*
T0*
_output_shapes

:
cicada-v2/dense2/truediv_1RealDivcicada-v2/dense2/mul_2:z:0cicada-v2/dense2/Pow:z:0*
T0*
_output_shapes

:]
cicada-v2/dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/dense2/mul_3Mul!cicada-v2/dense2/mul_3/x:output:0cicada-v2/dense2/truediv_1:z:0*
T0*
_output_shapes

:
!cicada-v2/dense2/ReadVariableOp_1ReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0q
cicada-v2/dense2/Neg_2Neg)cicada-v2/dense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:
cicada-v2/dense2/add_3AddV2cicada-v2/dense2/Neg_2:y:0cicada-v2/dense2/mul_3:z:0*
T0*
_output_shapes

:]
cicada-v2/dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/dense2/mul_4Mul!cicada-v2/dense2/mul_4/x:output:0cicada-v2/dense2/add_3:z:0*
T0*
_output_shapes

:t
cicada-v2/dense2/StopGradient_1StopGradientcicada-v2/dense2/mul_4:z:0*
T0*
_output_shapes

:
!cicada-v2/dense2/ReadVariableOp_2ReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0
cicada-v2/dense2/add_4AddV2)cicada-v2/dense2/ReadVariableOp_2:value:0(cicada-v2/dense2/StopGradient_1:output:0*
T0*
_output_shapes

:
cicada-v2/dense2/MatMulMatMul%cicada-v2/dropout_2/Identity:output:0cicada-v2/dense2/add_4:z:0*
T0*'
_output_shapes
:џџџџџџџџџY
cicada-v2/outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v2/outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
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
value	B :
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
 *  A}
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
: 
cicada-v2/outputs/LessEqual	LessEqual!cicada-v2/dense2/MatMul:product:0cicada-v2/outputs/sub_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџs
cicada-v2/outputs/ReluRelu!cicada-v2/dense2/MatMul:product:0*
T0*'
_output_shapes
:џџџџџџџџџr
!cicada-v2/outputs/ones_like/ShapeShape!cicada-v2/dense2/MatMul:product:0*
T0*
_output_shapes
:f
!cicada-v2/outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?­
cicada-v2/outputs/ones_likeFill*cicada-v2/outputs/ones_like/Shape:output:0*cicada-v2/outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџz
cicada-v2/outputs/sub_2Subcicada-v2/outputs/Cast_1:y:0cicada-v2/outputs/Pow_2:z:0*
T0*
_output_shapes
: 
cicada-v2/outputs/mulMul$cicada-v2/outputs/ones_like:output:0cicada-v2/outputs/sub_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџК
cicada-v2/outputs/SelectV2SelectV2cicada-v2/outputs/LessEqual:z:0$cicada-v2/outputs/Relu:activations:0cicada-v2/outputs/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/outputs/mul_1Mul!cicada-v2/dense2/MatMul:product:0cicada-v2/outputs/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/outputs/truedivRealDivcicada-v2/outputs/mul_1:z:0cicada-v2/outputs/Cast_1:y:0*
T0*'
_output_shapes
:џџџџџџџџџm
cicada-v2/outputs/NegNegcicada-v2/outputs/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџq
cicada-v2/outputs/RoundRoundcicada-v2/outputs/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/outputs/addAddV2cicada-v2/outputs/Neg:y:0cicada-v2/outputs/Round:y:0*
T0*'
_output_shapes
:џџџџџџџџџ{
cicada-v2/outputs/StopGradientStopGradientcicada-v2/outputs/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/outputs/add_1AddV2cicada-v2/outputs/truediv:z:0'cicada-v2/outputs/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/outputs/truediv_1RealDivcicada-v2/outputs/add_1:z:0cicada-v2/outputs/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџb
cicada-v2/outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/outputs/truediv_2RealDiv&cicada-v2/outputs/truediv_2/x:output:0cicada-v2/outputs/Cast:y:0*
T0*
_output_shapes
: ^
cicada-v2/outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/outputs/sub_3Sub"cicada-v2/outputs/sub_3/x:output:0cicada-v2/outputs/truediv_2:z:0*
T0*
_output_shapes
: Ђ
'cicada-v2/outputs/clip_by_value/MinimumMinimumcicada-v2/outputs/truediv_1:z:0cicada-v2/outputs/sub_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџf
!cicada-v2/outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Е
cicada-v2/outputs/clip_by_valueMaximum+cicada-v2/outputs/clip_by_value/Minimum:z:0*cicada-v2/outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/outputs/mul_2Mulcicada-v2/outputs/Cast_1:y:0#cicada-v2/outputs/clip_by_value:z:0*
T0*'
_output_shapes
:џџџџџџџџџu
cicada-v2/outputs/Neg_1Neg#cicada-v2/outputs/SelectV2:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
cicada-v2/outputs/add_2AddV2cicada-v2/outputs/Neg_1:y:0cicada-v2/outputs/mul_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ^
cicada-v2/outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
cicada-v2/outputs/mul_3Mul"cicada-v2/outputs/mul_3/x:output:0cicada-v2/outputs/add_2:z:0*
T0*'
_output_shapes
:џџџџџџџџџ
 cicada-v2/outputs/StopGradient_1StopGradientcicada-v2/outputs/mul_3:z:0*
T0*'
_output_shapes
:џџџџџџџџџЂ
cicada-v2/outputs/add_3AddV2#cicada-v2/outputs/SelectV2:output:0)cicada-v2/outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:џџџџџџџџџj
IdentityIdentitycicada-v2/outputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџЈ
NoOpNoOp^cicada-v2/conv/ReadVariableOp ^cicada-v2/conv/ReadVariableOp_1 ^cicada-v2/conv/ReadVariableOp_2%^cicada-v2/dense1/AssignAddVariableOp(^cicada-v2/dense1/BiasAdd/ReadVariableOp'^cicada-v2/dense1/MatMul/ReadVariableOp ^cicada-v2/dense1/ReadVariableOp"^cicada-v2/dense1/ReadVariableOp_1&^cicada-v2/dense1/add_2/ReadVariableOp@^cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOpB^cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1B^cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2D^cicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp$^cicada-v2/dense1/mul/ReadVariableOp&^cicada-v2/dense1/mul_1/ReadVariableOp&^cicada-v2/dense1/mul_3/ReadVariableOp$^cicada-v2/dense1/sub/ReadVariableOp ^cicada-v2/dense2/ReadVariableOp"^cicada-v2/dense2/ReadVariableOp_1"^cicada-v2/dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 2>
cicada-v2/conv/ReadVariableOpcicada-v2/conv/ReadVariableOp2B
cicada-v2/conv/ReadVariableOp_1cicada-v2/conv/ReadVariableOp_12B
cicada-v2/conv/ReadVariableOp_2cicada-v2/conv/ReadVariableOp_22L
$cicada-v2/dense1/AssignAddVariableOp$cicada-v2/dense1/AssignAddVariableOp2R
'cicada-v2/dense1/BiasAdd/ReadVariableOp'cicada-v2/dense1/BiasAdd/ReadVariableOp2P
&cicada-v2/dense1/MatMul/ReadVariableOp&cicada-v2/dense1/MatMul/ReadVariableOp2B
cicada-v2/dense1/ReadVariableOpcicada-v2/dense1/ReadVariableOp2F
!cicada-v2/dense1/ReadVariableOp_1!cicada-v2/dense1/ReadVariableOp_12N
%cicada-v2/dense1/add_2/ReadVariableOp%cicada-v2/dense1/add_2/ReadVariableOp2
?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp2
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_12
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_22
Ccicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpCcicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp2J
#cicada-v2/dense1/mul/ReadVariableOp#cicada-v2/dense1/mul/ReadVariableOp2N
%cicada-v2/dense1/mul_1/ReadVariableOp%cicada-v2/dense1/mul_1/ReadVariableOp2N
%cicada-v2/dense1/mul_3/ReadVariableOp%cicada-v2/dense1/mul_3/ReadVariableOp2J
#cicada-v2/dense1/sub/ReadVariableOp#cicada-v2/dense1/sub/ReadVariableOp2B
cicada-v2/dense2/ReadVariableOpcicada-v2/dense2/ReadVariableOp2F
!cicada-v2/dense2/ReadVariableOp_1!cicada-v2/dense2/ReadVariableOp_12F
!cicada-v2/dense2/ReadVariableOp_2!cicada-v2/dense2/ReadVariableOp_2:Q M
(
_output_shapes
:џџџџџџџџџќ
!
_user_specified_name	inputs_
ъ	
д
+__inference_cicada-v2_layer_call_fn_8678900

inputs!
unknown:
	unknown_0:	ќ
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityЂStatefulPartitionedCallГ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*(
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678715o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
ї
d
+__inference_dropout_1_layer_call_fn_8679771

inputs
identityЂStatefulPartitionedCallТ
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678629p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:џџџџџџџџџќ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
П%
у
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678359

inputs&
conv_8677997:!
dense1_8678189:	ќ
dense1_8678191:
dense1_8678193:
dense1_8678195:
dense1_8678197:
dense1_8678199:
dense1_8678201:	  
dense2_8678304:
identityЂconv/StatefulPartitionedCallЂdense1/StatefulPartitionedCallЂdense2/StatefulPartitionedCallП
reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_8677953ѕ
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_8677997*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_8677996к
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_8678049а
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_8678057ж
dropout_1/PartitionedCallPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678064р
dense1/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense1_8678189dense1_8678191dense1_8678193dense1_8678195dense1_8678197dense1_8678199dense1_8678201*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_8678188д
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_8678253г
dropout_2/PartitionedCallPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678260ѕ
dense2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense2_8678304*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_8678303и
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_8678356o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџЇ
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs


C__inference_dense1_layer_call_and_return_conditional_losses_8678592

inputs1
matmul_readvariableop_resource:	ќ-
biasadd_readvariableop_resource:K
=batch_normalization_1_assignmovingavg_readvariableop_resource:M
?batch_normalization_1_assignmovingavg_1_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identityЂAssignAddVariableOpЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpЂReadVariableOpЂReadVariableOp_1ЂReadVariableOp_2Ђadd_2/ReadVariableOpЂ%batch_normalization_1/AssignMovingAvgЂ4batch_normalization_1/AssignMovingAvg/ReadVariableOpЂ'batch_normalization_1/AssignMovingAvg_1Ђ6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpЂ.batch_normalization_1/batchnorm/ReadVariableOpЂ2batch_normalization_1/batchnorm/mul/ReadVariableOpЂmul/ReadVariableOpЂmul_1/ReadVariableOpЂmul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ~
4batch_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Е
"batch_normalization_1/moments/meanMeanBiasAdd:output:0=batch_normalization_1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(
*batch_normalization_1/moments/StopGradientStopGradient+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes

:Н
/batch_normalization_1/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:03batch_normalization_1/moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
8batch_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: р
&batch_normalization_1/moments/varianceMean3batch_normalization_1/moments/SquaredDifference:z:0Abatch_normalization_1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(
%batch_normalization_1/moments/SqueezeSqueeze+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 
'batch_normalization_1/moments/Squeeze_1Squeeze/batch_normalization_1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 p
+batch_normalization_1/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
з#<Ў
4batch_normalization_1/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0У
)batch_normalization_1/AssignMovingAvg/subSub<batch_normalization_1/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_1/moments/Squeeze:output:0*
T0*
_output_shapes
:К
)batch_normalization_1/AssignMovingAvg/mulMul-batch_normalization_1/AssignMovingAvg/sub:z:04batch_normalization_1/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:
%batch_normalization_1/AssignMovingAvgAssignSubVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource-batch_normalization_1/AssignMovingAvg/mul:z:05^batch_normalization_1/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0r
-batch_normalization_1/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
з#<В
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0Щ
+batch_normalization_1/AssignMovingAvg_1/subSub>batch_normalization_1/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_1/moments/Squeeze_1:output:0*
T0*
_output_shapes
:Р
+batch_normalization_1/AssignMovingAvg_1/mulMul/batch_normalization_1/AssignMovingAvg_1/sub:z:06batch_normalization_1/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:
'batch_normalization_1/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource/batch_normalization_1/AssignMovingAvg_1/mul:z:07^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Г
#batch_normalization_1/batchnorm/addAddV20batch_normalization_1/moments/Squeeze_1:output:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:Њ
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ж
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:џџџџџџџџџЊ
%batch_normalization_1/batchnorm/mul_2Mul.batch_normalization_1/moments/Squeeze:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:Ђ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0В
#batch_normalization_1/batchnorm/subSub6batch_normalization_1/batchnorm/ReadVariableOp:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Д
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:џџџџџџџџџG
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
valueB: 
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:џџџџџџџџџl
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
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
 Д
ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:Y
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
 *o:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
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
:
add_2/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ќ*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ќJ
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
 *  р@K
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
 *  ?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ќR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ќA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ќE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ќL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ќQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ќ\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ќ6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ќh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ќT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ќR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ќL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ќA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ќN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ќL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ќS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ќ\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ќL
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
 *  р@Q
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
 *  ?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?M
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
 *  ?J
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
 *  ?T
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
 *  ?Q
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
:џџџџџџџџџM
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:Ж
ReadVariableOp_2ReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:a
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
 *o:c
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
:џџџџџџџџџ^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:џџџџџџџџџa
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџЦ
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp&^batch_normalization_1/AssignMovingAvg5^batch_normalization_1/AssignMovingAvg/ReadVariableOp(^batch_normalization_1/AssignMovingAvg_17^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp3^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":џџџџџџџџџќ: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22,
add_2/ReadVariableOpadd_2/ReadVariableOp2N
%batch_normalization_1/AssignMovingAvg%batch_normalization_1/AssignMovingAvg2l
4batch_normalization_1/AssignMovingAvg/ReadVariableOp4batch_normalization_1/AssignMovingAvg/ReadVariableOp2R
'batch_normalization_1/AssignMovingAvg_1'batch_normalization_1/AssignMovingAvg_12p
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Б(
Ћ
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678715

inputs&
conv_8678687:!
dense1_8678693:	ќ
dense1_8678695:
dense1_8678697:
dense1_8678699:
dense1_8678701:
dense1_8678703:
dense1_8678705:	  
dense2_8678710:
identityЂconv/StatefulPartitionedCallЂdense1/StatefulPartitionedCallЂdense2/StatefulPartitionedCallЂ!dropout_1/StatefulPartitionedCallЂ!dropout_2/StatefulPartitionedCallП
reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_8677953ѕ
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_8678687*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_conv_layer_call_and_return_conditional_losses_8677996к
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu0_layer_call_and_return_conditional_losses_8678049а
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_8678057ц
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678629ц
dense1/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense1_8678693dense1_8678695dense1_8678697dense1_8678699dense1_8678701dense1_8678703dense1_8678705*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_8678592д
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_relu1_layer_call_and_return_conditional_losses_8678253
!dropout_2/StatefulPartitionedCallStatefulPartitionedCallrelu1/PartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_2_layer_call_and_return_conditional_losses_8678414§
dense2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense2_8678710*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense2_layer_call_and_return_conditional_losses_8678303и
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_8678356o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџя
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџќ: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Џ
E
)__inference_flatten_layer_call_fn_8679755

inputs
identityА
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_8678057a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
Џ
E
)__inference_reshape_layer_call_fn_8679634

inputs
identityЗ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_reshape_layer_call_and_return_conditional_losses_8677953h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
є	
e
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680176

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:џџџџџџџџџC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >І
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџo
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:џџџџџџџџџi
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:џџџџџџџџџY
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ѕ
G
+__inference_dropout_1_layer_call_fn_8679766

inputs
identityВ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџќ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678064a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
н
d
F__inference_dropout_1_layer_call_and_return_conditional_losses_8678064

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:џџџџџџџџџќ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:џџџџџџџџџќ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs

E
)__inference_outputs_layer_call_fn_8680229

inputs
identityЏ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_outputs_layer_call_and_return_conditional_losses_8678356`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
	

(__inference_dense1_layer_call_fn_8679826

inputs
unknown:	ќ
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dense1_layer_call_and_return_conditional_losses_8678592o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":џџџџџџџџџќ: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
ј
Ъ
A__inference_conv_layer_call_and_return_conditional_losses_8679696

inputs1
readvariableop_resource:
identityЂReadVariableOpЂReadVariableOp_1ЂReadVariableOp_2J
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
 *  ?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?D
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
 *  ?^
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
 *  ?Z
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
:
convolutionConv2Dinputs	add_4:z:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingVALID*
strides
k
IdentityIdentityconvolution:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:џџџџџџџџџ: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs"Е	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ћ
serving_default
<
inputs_1
serving_default_inputs_:0џџџџџџџџџќ;
outputs0
StatefulPartitionedCall:0џџџџџџџџџtensorflow/serving/predict:щ
С
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
Ѕ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer

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
Д
%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses
+	quantizer"
_tf_keras_layer
Ѕ
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses"
_tf_keras_layer
М
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8_random_generator"
_tf_keras_layer
а
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
Д
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses
L	quantizer"
_tf_keras_layer
М
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses
S_random_generator"
_tf_keras_layer
і
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
Д
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
Ъ
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
с
mtrace_0
ntrace_1
otrace_2
ptrace_32і
+__inference_cicada-v2_layer_call_fn_8678380
+__inference_cicada-v2_layer_call_fn_8678877
+__inference_cicada-v2_layer_call_fn_8678900
+__inference_cicada-v2_layer_call_fn_8678759П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zmtrace_0zntrace_1zotrace_2zptrace_3
Э
qtrace_0
rtrace_1
strace_2
ttrace_32т
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679245
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679629
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678791
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678823П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zqtrace_0zrtrace_1zstrace_2zttrace_3
ЭBЪ
"__inference__wrapped_model_8677850inputs_"
В
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ы
uiter

vbeta_1

wbeta_2
	xdecay
ylearning_rate#mмCmнDmо\mпdmрemс#vтCvуDvф\vхdvцevч"
	optimizer
,
zserving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
{non_trainable_variables

|layers
}metrics
~layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
я
trace_02а
)__inference_reshape_layer_call_fn_8679634Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0

trace_02ы
D__inference_reshape_layer_call_and_return_conditional_losses_8679648Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0
'
#0"
trackable_list_wrapper
'
#0"
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses"
_generic_user_object
ь
trace_02Э
&__inference_conv_layer_call_fn_8679655Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0

trace_02ш
A__inference_conv_layer_call_and_return_conditional_losses_8679696Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0
"
_generic_user_object
'
!0"
trackable_list_wrapper
%:#2conv/kernel
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses"
_generic_user_object
э
trace_02Ю
'__inference_relu0_layer_call_fn_8679701Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0

trace_02щ
B__inference_relu0_layer_call_and_return_conditional_losses_8679750Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
я
trace_02а
)__inference_flatten_layer_call_fn_8679755Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0

trace_02ы
D__inference_flatten_layer_call_and_return_conditional_losses_8679761Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses"
_generic_user_object
Ы
trace_0
trace_12
+__inference_dropout_1_layer_call_fn_8679766
+__inference_dropout_1_layer_call_fn_8679771Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1

trace_0
trace_12Ц
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679776
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679788Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1
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
В
 non_trainable_variables
Ёlayers
Ђmetrics
 Ѓlayer_regularization_losses
Єlayer_metrics
9	variables
:trainable_variables
;regularization_losses
=__call__
*>&call_and_return_all_conditional_losses
&>"call_and_return_conditional_losses"
_generic_user_object
Х
Ѕtrace_0
Іtrace_12
(__inference_dense1_layer_call_fn_8679807
(__inference_dense1_layer_call_fn_8679826Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЅtrace_0zІtrace_1
ћ
Їtrace_0
Јtrace_12Р
C__inference_dense1_layer_call_and_return_conditional_losses_8679948
C__inference_dense1_layer_call_and_return_conditional_losses_8680095Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЇtrace_0zЈtrace_1
"
_generic_user_object
"
_generic_user_object
.
?0
@1"
trackable_list_wrapper
ё
Љ	variables
Њtrainable_variables
Ћregularization_losses
Ќ	keras_api
­__call__
+Ў&call_and_return_all_conditional_losses
	Џaxis
	dgamma
ebeta
fmoving_mean
gmoving_variance"
_tf_keras_layer
 :	ќ2dense1/kernel
:2dense1/bias
:	 2dense1/iteration
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses"
_generic_user_object
э
Еtrace_02Ю
'__inference_relu1_layer_call_fn_8680100Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЕtrace_0

Жtrace_02щ
B__inference_relu1_layer_call_and_return_conditional_losses_8680149Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЖtrace_0
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
Ы
Мtrace_0
Нtrace_12
+__inference_dropout_2_layer_call_fn_8680154
+__inference_dropout_2_layer_call_fn_8680159Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zМtrace_0zНtrace_1

Оtrace_0
Пtrace_12Ц
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680164
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680176Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zОtrace_0zПtrace_1
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
В
Рnon_trainable_variables
Сlayers
Тmetrics
 Уlayer_regularization_losses
Фlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
ю
Хtrace_02Я
(__inference_dense2_layer_call_fn_8680183Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zХtrace_0

Цtrace_02ъ
C__inference_dense2_layer_call_and_return_conditional_losses_8680224Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЦtrace_0
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
В
Чnon_trainable_variables
Шlayers
Щmetrics
 Ъlayer_regularization_losses
Ыlayer_metrics
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses"
_generic_user_object
я
Ьtrace_02а
)__inference_outputs_layer_call_fn_8680229Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЬtrace_0

Эtrace_02ы
D__inference_outputs_layer_call_and_return_conditional_losses_8680278Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЭtrace_0
"
_generic_user_object
0:.2"dense1/batch_normalization_1/gamma
/:-2!dense1/batch_normalization_1/beta
8:6 (2(dense1/batch_normalization_1/moving_mean
<:: (2,dense1/batch_normalization_1/moving_variance
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
Ю0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
§Bњ
+__inference_cicada-v2_layer_call_fn_8678380inputs_"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ќBљ
+__inference_cicada-v2_layer_call_fn_8678877inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ќBљ
+__inference_cicada-v2_layer_call_fn_8678900inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
§Bњ
+__inference_cicada-v2_layer_call_fn_8678759inputs_"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679245inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679629inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678791inputs_"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678823inputs_"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
ЬBЩ
%__inference_signature_wrapper_8678854inputs_"
В
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
нBк
)__inference_reshape_layer_call_fn_8679634inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
јBѕ
D__inference_reshape_layer_call_and_return_conditional_losses_8679648inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
кBз
&__inference_conv_layer_call_fn_8679655inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѕBђ
A__inference_conv_layer_call_and_return_conditional_losses_8679696inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
лBи
'__inference_relu0_layer_call_fn_8679701inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_relu0_layer_call_and_return_conditional_losses_8679750inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
нBк
)__inference_flatten_layer_call_fn_8679755inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
јBѕ
D__inference_flatten_layer_call_and_return_conditional_losses_8679761inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
№Bэ
+__inference_dropout_1_layer_call_fn_8679766inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
№Bэ
+__inference_dropout_1_layer_call_fn_8679771inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679776inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679788inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
эBъ
(__inference_dense1_layer_call_fn_8679807inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
эBъ
(__inference_dense1_layer_call_fn_8679826inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
C__inference_dense1_layer_call_and_return_conditional_losses_8679948inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
C__inference_dense1_layer_call_and_return_conditional_losses_8680095inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
И
Яnon_trainable_variables
аlayers
бmetrics
 вlayer_regularization_losses
гlayer_metrics
Љ	variables
Њtrainable_variables
Ћregularization_losses
­__call__
+Ў&call_and_return_all_conditional_losses
'Ў"call_and_return_conditional_losses"
_generic_user_object
у
дtrace_0
еtrace_12Ј
7__inference_batch_normalization_1_layer_call_fn_8680291
7__inference_batch_normalization_1_layer_call_fn_8680304Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zдtrace_0zеtrace_1

жtrace_0
зtrace_12о
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680324
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680358Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zжtrace_0zзtrace_1
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
лBи
'__inference_relu1_layer_call_fn_8680100inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_relu1_layer_call_and_return_conditional_losses_8680149inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
№Bэ
+__inference_dropout_2_layer_call_fn_8680154inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
№Bэ
+__inference_dropout_2_layer_call_fn_8680159inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680164inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680176inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
мBй
(__inference_dense2_layer_call_fn_8680183inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
C__inference_dense2_layer_call_and_return_conditional_losses_8680224inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
нBк
)__inference_outputs_layer_call_fn_8680229inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
јBѕ
D__inference_outputs_layer_call_and_return_conditional_losses_8680278inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
R
и	variables
й	keras_api

кtotal

лcount"
_tf_keras_metric
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
ќBљ
7__inference_batch_normalization_1_layer_call_fn_8680291inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ќBљ
7__inference_batch_normalization_1_layer_call_fn_8680304inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680324inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680358inputs"Г
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
0
к0
л1"
trackable_list_wrapper
.
и	variables"
_generic_user_object
:  (2total
:  (2count
*:(2Adam/conv/kernel/m
%:#	ќ2Adam/dense1/kernel/m
:2Adam/dense1/bias/m
$:"2Adam/dense2/kernel/m
5:32)Adam/dense1/batch_normalization_1/gamma/m
4:22(Adam/dense1/batch_normalization_1/beta/m
*:(2Adam/conv/kernel/v
%:#	ќ2Adam/dense1/kernel/v
:2Adam/dense1/bias/v
$:"2Adam/dense2/kernel/v
5:32)Adam/dense1/batch_normalization_1/gamma/v
4:22(Adam/dense1/batch_normalization_1/beta/v
"__inference__wrapped_model_8677850q	#CDgdfeE\1Ђ.
'Ђ$
"
inputs_џџџџџџџџџќ
Њ "1Њ.
,
outputs!
outputsџџџџџџџџџИ
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680324bgdfe3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p 
Њ "%Ђ"

0џџџџџџџџџ
 И
R__inference_batch_normalization_1_layer_call_and_return_conditional_losses_8680358bfgde3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p
Њ "%Ђ"

0џџџџџџџџџ
 
7__inference_batch_normalization_1_layer_call_fn_8680291Ugdfe3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p 
Њ "џџџџџџџџџ
7__inference_batch_normalization_1_layer_call_fn_8680304Ufgde3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p
Њ "џџџџџџџџџЗ
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678791m	#CDgdfeE\9Ђ6
/Ђ,
"
inputs_џџџџџџџџџќ
p 

 
Њ "%Ђ"

0џџџџџџџџџ
 З
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8678823m	#CDfgdeE\9Ђ6
/Ђ,
"
inputs_џџџџџџџџџќ
p

 
Њ "%Ђ"

0џџџџџџџџџ
 Ж
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679245l	#CDgdfeE\8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p 

 
Њ "%Ђ"

0џџџџџџџџџ
 Ж
F__inference_cicada-v2_layer_call_and_return_conditional_losses_8679629l	#CDfgdeE\8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p

 
Њ "%Ђ"

0џџџџџџџџџ
 
+__inference_cicada-v2_layer_call_fn_8678380`	#CDgdfeE\9Ђ6
/Ђ,
"
inputs_џџџџџџџџџќ
p 

 
Њ "џџџџџџџџџ
+__inference_cicada-v2_layer_call_fn_8678759`	#CDfgdeE\9Ђ6
/Ђ,
"
inputs_џџџџџџџџџќ
p

 
Њ "џџџџџџџџџ
+__inference_cicada-v2_layer_call_fn_8678877_	#CDgdfeE\8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p 

 
Њ "џџџџџџџџџ
+__inference_cicada-v2_layer_call_fn_8678900_	#CDfgdeE\8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p

 
Њ "џџџџџџџџџА
A__inference_conv_layer_call_and_return_conditional_losses_8679696k#7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ
Њ "-Ђ*
# 
0џџџџџџџџџ	
 
&__inference_conv_layer_call_fn_8679655^#7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ
Њ " џџџџџџџџџ	­
C__inference_dense1_layer_call_and_return_conditional_losses_8679948fCDgdfeE4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p 
Њ "%Ђ"

0џџџџџџџџџ
 ­
C__inference_dense1_layer_call_and_return_conditional_losses_8680095fCDfgdeE4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p
Њ "%Ђ"

0џџџџџџџџџ
 
(__inference_dense1_layer_call_fn_8679807YCDgdfeE4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p 
Њ "џџџџџџџџџ
(__inference_dense1_layer_call_fn_8679826YCDfgdeE4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p
Њ "џџџџџџџџџЂ
C__inference_dense2_layer_call_and_return_conditional_losses_8680224[\/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ
 z
(__inference_dense2_layer_call_fn_8680183N\/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџЈ
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679776^4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p 
Њ "&Ђ#

0џџџџџџџџџќ
 Ј
F__inference_dropout_1_layer_call_and_return_conditional_losses_8679788^4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p
Њ "&Ђ#

0џџџџџџџџџќ
 
+__inference_dropout_1_layer_call_fn_8679766Q4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p 
Њ "џџџџџџџџџќ
+__inference_dropout_1_layer_call_fn_8679771Q4Ђ1
*Ђ'
!
inputsџџџџџџџџџќ
p
Њ "џџџџџџџџџќІ
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680164\3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p 
Њ "%Ђ"

0џџџџџџџџџ
 І
F__inference_dropout_2_layer_call_and_return_conditional_losses_8680176\3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p
Њ "%Ђ"

0џџџџџџџџџ
 ~
+__inference_dropout_2_layer_call_fn_8680154O3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p 
Њ "џџџџџџџџџ~
+__inference_dropout_2_layer_call_fn_8680159O3Ђ0
)Ђ&
 
inputsџџџџџџџџџ
p
Њ "џџџџџџџџџЉ
D__inference_flatten_layer_call_and_return_conditional_losses_8679761a7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ "&Ђ#

0џџџџџџџџџќ
 
)__inference_flatten_layer_call_fn_8679755T7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ "џџџџџџџџџќ 
D__inference_outputs_layer_call_and_return_conditional_losses_8680278X/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ
 x
)__inference_outputs_layer_call_fn_8680229K/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџЎ
B__inference_relu0_layer_call_and_return_conditional_losses_8679750h7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ "-Ђ*
# 
0џџџџџџџџџ	
 
'__inference_relu0_layer_call_fn_8679701[7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ " џџџџџџџџџ	
B__inference_relu1_layer_call_and_return_conditional_losses_8680149X/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ
 v
'__inference_relu1_layer_call_fn_8680100K/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџЉ
D__inference_reshape_layer_call_and_return_conditional_losses_8679648a0Ђ-
&Ђ#
!
inputsџџџџџџџџџќ
Њ "-Ђ*
# 
0џџџџџџџџџ
 
)__inference_reshape_layer_call_fn_8679634T0Ђ-
&Ђ#
!
inputsџџџџџџџџџќ
Њ " џџџџџџџџџЅ
%__inference_signature_wrapper_8678854|	#CDgdfeE\<Ђ9
Ђ 
2Њ/
-
inputs_"
inputs_џџџџџџџџџќ"1Њ.
,
outputs!
outputsџџџџџџџџџ