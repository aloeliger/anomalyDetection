жъ
х≈
D
AddV2
x"T
y"T
z"T"
Ttype:
2	АР
E
AssignAddVariableOp
resource
value"dtype"
dtypetypeИ
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
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
Н
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
Ж
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( И
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
2	Р
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
dtypetypeИ
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
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
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
list(type)(0И
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

2	Р
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
Ѕ
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
executor_typestring И®
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
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.10.02v2.10.0-rc3-6-g359c3cdfc5f8ю£
§
&Adam/dense1/batch_normalization/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dense1/batch_normalization/beta/v
Э
:Adam/dense1/batch_normalization/beta/v/Read/ReadVariableOpReadVariableOp&Adam/dense1/batch_normalization/beta/v*
_output_shapes
:*
dtype0
¶
'Adam/dense1/batch_normalization/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*8
shared_name)'Adam/dense1/batch_normalization/gamma/v
Я
;Adam/dense1/batch_normalization/gamma/v/Read/ReadVariableOpReadVariableOp'Adam/dense1/batch_normalization/gamma/v*
_output_shapes
:*
dtype0
Д
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
Е
Adam/dense1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ь*%
shared_nameAdam/dense1/kernel/v
~
(Adam/dense1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense1/kernel/v*
_output_shapes
:	ь*
dtype0
§
&Adam/dense1/batch_normalization/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&Adam/dense1/batch_normalization/beta/m
Э
:Adam/dense1/batch_normalization/beta/m/Read/ReadVariableOpReadVariableOp&Adam/dense1/batch_normalization/beta/m*
_output_shapes
:*
dtype0
¶
'Adam/dense1/batch_normalization/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*8
shared_name)'Adam/dense1/batch_normalization/gamma/m
Я
;Adam/dense1/batch_normalization/gamma/m/Read/ReadVariableOpReadVariableOp'Adam/dense1/batch_normalization/gamma/m*
_output_shapes
:*
dtype0
Д
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
Е
Adam/dense1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ь*%
shared_nameAdam/dense1/kernel/m
~
(Adam/dense1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense1/kernel/m*
_output_shapes
:	ь*
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
ђ
*dense1/batch_normalization/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*;
shared_name,*dense1/batch_normalization/moving_variance
•
>dense1/batch_normalization/moving_variance/Read/ReadVariableOpReadVariableOp*dense1/batch_normalization/moving_variance*
_output_shapes
:*
dtype0
§
&dense1/batch_normalization/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&dense1/batch_normalization/moving_mean
Э
:dense1/batch_normalization/moving_mean/Read/ReadVariableOpReadVariableOp&dense1/batch_normalization/moving_mean*
_output_shapes
:*
dtype0
Ц
dense1/batch_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!dense1/batch_normalization/beta
П
3dense1/batch_normalization/beta/Read/ReadVariableOpReadVariableOpdense1/batch_normalization/beta*
_output_shapes
:*
dtype0
Ш
 dense1/batch_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*1
shared_name" dense1/batch_normalization/gamma
С
4dense1/batch_normalization/gamma/Read/ReadVariableOpReadVariableOp dense1/batch_normalization/gamma*
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
shape:	ь*
shared_namedense1/kernel
p
!dense1/kernel/Read/ReadVariableOpReadVariableOpdense1/kernel*
_output_shapes
:	ь*
dtype0
|
serving_default_inputs_Placeholder*(
_output_shapes
:€€€€€€€€€ь*
dtype0*
shape:€€€€€€€€€ь
Х
StatefulPartitionedCallStatefulPartitionedCallserving_default_inputs_dense1/kerneldense1/bias*dense1/batch_normalization/moving_variance dense1/batch_normalization/gamma&dense1/batch_normalization/moving_meandense1/batch_normalization/betadense1/iterationdense2/kernel*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*)
_read_only_resource_inputs
	*-
config_proto

CPU

GPU 2J 8В *-
f(R&
$__inference_signature_wrapper_171643

NoOpNoOp
ш<
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*≥<
value©<B¶< BЯ<
ќ
layer-0
layer_with_weights-0
layer-1
layer-2
layer-3
layer_with_weights-1
layer-4
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
ї
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
kernel_quantizer
bias_quantizer
kernel_quantizer_internal
bias_quantizer_internal

quantizers
	batchnorm

kernel
bias

_iteration*
Э
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses
#	quantizer* 
•
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
*_random_generator* 
б
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses
1kernel_quantizer
1kernel_quantizer_internal
2
quantizers

3kernel*
Э
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses
:	quantizer* 
<
0
1
;2
<3
4
=5
>6
37*
'
0
1
;2
<3
34*
* 
∞
?non_trainable_variables

@layers
Ametrics
Blayer_regularization_losses
Clayer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
Dtrace_0
Etrace_1
Ftrace_2
Gtrace_3* 
6
Htrace_0
Itrace_1
Jtrace_2
Ktrace_3* 
* 
®
Liter

Mbeta_1

Nbeta_2
	Odecay
Plearning_ratemОmП3mР;mС<mТvУvФ3vХ;vЦ<vЧ*

Qserving_default* 
5
0
1
;2
<3
4
=5
>6*
 
0
1
;2
<3*
* 
У
Rnon_trainable_variables

Slayers
Tmetrics
Ulayer_regularization_losses
Vlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Wtrace_0
Xtrace_1* 

Ytrace_0
Ztrace_1* 
* 
* 

0
1* 
’
[	variables
\trainable_variables
]regularization_losses
^	keras_api
___call__
*`&call_and_return_all_conditional_losses
aaxis
	;gamma
<beta
=moving_mean
>moving_variance*
]W
VARIABLE_VALUEdense1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUEdense1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEdense1/iteration:layer_with_weights-0/_iteration/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
С
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses* 

gtrace_0* 

htrace_0* 
* 
* 
* 
* 
С
inon_trainable_variables

jlayers
kmetrics
llayer_regularization_losses
mlayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses* 

ntrace_0
otrace_1* 

ptrace_0
qtrace_1* 
* 

30*

30*
* 
У
rnon_trainable_variables

slayers
tmetrics
ulayer_regularization_losses
vlayer_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses*

wtrace_0* 

xtrace_0* 
* 
	
10* 
]W
VARIABLE_VALUEdense2/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
С
ynon_trainable_variables

zlayers
{metrics
|layer_regularization_losses
}layer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses* 

~trace_0* 

trace_0* 
* 
`Z
VARIABLE_VALUE dense1/batch_normalization/gamma&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEdense1/batch_normalization/beta&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUE&dense1/batch_normalization/moving_mean&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUE*dense1/batch_normalization/moving_variance&variables/6/.ATTRIBUTES/VARIABLE_VALUE*

0
=1
>2*
.
0
1
2
3
4
5*

А0*
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

0
=1
>2*

0*
* 
* 
* 
* 
* 
* 
* 
 
;0
<1
=2
>3*

;0
<1*
* 
Ш
Бnon_trainable_variables
Вlayers
Гmetrics
 Дlayer_regularization_losses
Еlayer_metrics
[	variables
\trainable_variables
]regularization_losses
___call__
*`&call_and_return_all_conditional_losses
&`"call_and_return_conditional_losses*

Жtrace_0
Зtrace_1* 

Иtrace_0
Йtrace_1* 
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
К	variables
Л	keras_api

Мtotal

Нcount*

=0
>1*
* 
* 
* 
* 
* 
* 
* 
* 

М0
Н1*

К	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense1/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense1/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense2/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Г}
VARIABLE_VALUE'Adam/dense1/batch_normalization/gamma/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
В|
VARIABLE_VALUE&Adam/dense1/batch_normalization/beta/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense1/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense1/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense2/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Г}
VARIABLE_VALUE'Adam/dense1/batch_normalization/gamma/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
В|
VARIABLE_VALUE&Adam/dense1/batch_normalization/beta/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
с

StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename!dense1/kernel/Read/ReadVariableOpdense1/bias/Read/ReadVariableOp$dense1/iteration/Read/ReadVariableOp!dense2/kernel/Read/ReadVariableOp4dense1/batch_normalization/gamma/Read/ReadVariableOp3dense1/batch_normalization/beta/Read/ReadVariableOp:dense1/batch_normalization/moving_mean/Read/ReadVariableOp>dense1/batch_normalization/moving_variance/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp(Adam/dense1/kernel/m/Read/ReadVariableOp&Adam/dense1/bias/m/Read/ReadVariableOp(Adam/dense2/kernel/m/Read/ReadVariableOp;Adam/dense1/batch_normalization/gamma/m/Read/ReadVariableOp:Adam/dense1/batch_normalization/beta/m/Read/ReadVariableOp(Adam/dense1/kernel/v/Read/ReadVariableOp&Adam/dense1/bias/v/Read/ReadVariableOp(Adam/dense2/kernel/v/Read/ReadVariableOp;Adam/dense1/batch_normalization/gamma/v/Read/ReadVariableOp:Adam/dense1/batch_normalization/beta/v/Read/ReadVariableOpConst*&
Tin
2		*
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
GPU 2J 8В *(
f#R!
__inference__traced_save_172885
ш
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense1/kerneldense1/biasdense1/iterationdense2/kernel dense1/batch_normalization/gammadense1/batch_normalization/beta&dense1/batch_normalization/moving_mean*dense1/batch_normalization/moving_variance	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcountAdam/dense1/kernel/mAdam/dense1/bias/mAdam/dense2/kernel/m'Adam/dense1/batch_normalization/gamma/m&Adam/dense1/batch_normalization/beta/mAdam/dense1/kernel/vAdam/dense1/bias/vAdam/dense2/kernel/v'Adam/dense1/batch_normalization/gamma/v&Adam/dense1/batch_normalization/beta/v*%
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
GPU 2J 8В *+
f&R$
"__inference__traced_restore_172970…Ь
÷
a
C__inference_dropout_layer_call_and_return_conditional_losses_172593

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
у 
]
A__inference_relu1_layer_call_and_return_conditional_losses_171122

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
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ћ
Ѓ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_170870

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identityИҐbatchnorm/ReadVariableOpҐbatchnorm/ReadVariableOp_1Ґbatchnorm/ReadVariableOp_2Ґbatchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:w
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
:€€€€€€€€€z
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
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Ї
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ы
D
(__inference_dropout_layer_call_fn_172583

inputs
identityЃ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_171129`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
у 
]
A__inference_relu1_layer_call_and_return_conditional_losses_172578

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
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
В	
О
'__inference_dense1_layer_call_fn_172255

inputs
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identityИҐStatefulPartitionedCallХ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_171459o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
Ы
D
(__inference_outputs_layer_call_fn_172658

inputs
identityЃ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_171225`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Шi
•
B__inference_dense1_layer_call_and_return_conditional_losses_172377

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:C
5batch_normalization_batchnorm_readvariableop_resource:G
9batch_normalization_batchnorm_mul_readvariableop_resource:E
7batch_normalization_batchnorm_readvariableop_1_resource:E
7batch_normalization_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1Ґadd_2/ReadVariableOpҐ,batch_normalization/batchnorm/ReadVariableOpҐ.batch_normalization/batchnorm/ReadVariableOp_1Ґ.batch_normalization/batchnorm/ReadVariableOp_2Ґ0batch_normalization/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpҐsub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Ю
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:≥
!batch_normalization/batchnorm/addAddV24batch_normalization/batchnorm/ReadVariableOp:value:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
:x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
:¶
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0∞
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Х
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ґ
.batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOp7batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0Ѓ
#batch_normalization/batchnorm/mul_2Mul6batch_normalization/batchnorm/ReadVariableOp_1:value:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
:Ґ
.batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOp7batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0Ѓ
!batch_normalization/batchnorm/subSub6batch_normalization/batchnorm/ReadVariableOp_2:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Ѓ
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
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
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
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
 А
ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
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
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:И
mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:К
mul_1/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
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
dtype0Ж
sub/ReadVariableOpReadVariableOp7batch_normalization_batchnorm_readvariableop_1_resource*
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
:И
add_2/ReadVariableOpReadVariableOp7batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
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
 *  а@K
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
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
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
 *  а@Q
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
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
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
 *  А?J
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
 *  А?T
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
 *  А?Q
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
:€€€€€€€€€f
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€д
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp/^batch_normalization/batchnorm/ReadVariableOp_1/^batch_normalization/batchnorm/ReadVariableOp_21^batch_normalization/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12,
add_2/ReadVariableOpadd_2/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2`
.batch_normalization/batchnorm/ReadVariableOp_1.batch_normalization/batchnorm/ReadVariableOp_12`
.batch_normalization/batchnorm/ReadVariableOp_2.batch_normalization/batchnorm/ReadVariableOp_22d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
є	
ѓ
*__inference_cicada-v1_layer_call_fn_171247
inputs_
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
	unknown_6:
identityИҐStatefulPartitionedCall®
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*)
_read_only_resource_inputs
	*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171228o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
ћ
Ѓ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172753

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identityИҐbatchnorm/ReadVariableOpҐbatchnorm/ReadVariableOp_1Ґbatchnorm/ReadVariableOp_2Ґbatchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:w
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
:€€€€€€€€€z
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
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Ї
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
с	
b
C__inference_dropout_layer_call_and_return_conditional_losses_171281

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%IТ?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Р%
и
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172787

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identityИҐAssignMovingAvgҐAssignMovingAvg/ReadVariableOpҐAssignMovingAvg_1Ґ AssignMovingAvg_1/ReadVariableOpҐbatchnorm/ReadVariableOpҐbatchnorm/mul/ReadVariableOph
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

:З
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
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
„#<В
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0Б
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:ђ
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
„#<Ж
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0З
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:і
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:q
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
:€€€€€€€€€h
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
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€к
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ґ	
Ѓ
*__inference_cicada-v1_layer_call_fn_171664

inputs
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
	unknown_6:
identityИҐStatefulPartitionedCallІ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*)
_read_only_resource_inputs
	*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171228o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
Шi
•
B__inference_dense1_layer_call_and_return_conditional_losses_171057

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:C
5batch_normalization_batchnorm_readvariableop_resource:G
9batch_normalization_batchnorm_mul_readvariableop_resource:E
7batch_normalization_batchnorm_readvariableop_1_resource:E
7batch_normalization_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1Ґadd_2/ReadVariableOpҐ,batch_normalization/batchnorm/ReadVariableOpҐ.batch_normalization/batchnorm/ReadVariableOp_1Ґ.batch_normalization/batchnorm/ReadVariableOp_2Ґ0batch_normalization/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpҐsub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Ю
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:≥
!batch_normalization/batchnorm/addAddV24batch_normalization/batchnorm/ReadVariableOp:value:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
:x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
:¶
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0∞
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Х
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ґ
.batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOp7batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0Ѓ
#batch_normalization/batchnorm/mul_2Mul6batch_normalization/batchnorm/ReadVariableOp_1:value:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
:Ґ
.batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOp7batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0Ѓ
!batch_normalization/batchnorm/subSub6batch_normalization/batchnorm/ReadVariableOp_2:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Ѓ
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
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
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
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
 А
ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
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
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:И
mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:К
mul_1/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
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
dtype0Ж
sub/ReadVariableOpReadVariableOp7batch_normalization_batchnorm_readvariableop_1_resource*
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
:И
add_2/ReadVariableOpReadVariableOp7batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
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
 *  а@K
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
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
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
 *  а@Q
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
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
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
 *  А?J
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
 *  А?T
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
 *  А?Q
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
:€€€€€€€€€f
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€д
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp/^batch_normalization/batchnorm/ReadVariableOp_1/^batch_normalization/batchnorm/ReadVariableOp_21^batch_normalization/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12,
add_2/ReadVariableOpadd_2/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2`
.batch_normalization/batchnorm/ReadVariableOp_1.batch_normalization/batchnorm/ReadVariableOp_12`
.batch_normalization/batchnorm/ReadVariableOp_2.batch_normalization/batchnorm/ReadVariableOp_22d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
х 
_
C__inference_outputs_layer_call_and_return_conditional_losses_171225

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
 *  АAG
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
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ќЙ
Е
B__inference_dense1_layer_call_and_return_conditional_losses_172524

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:I
;batch_normalization_assignmovingavg_readvariableop_resource:K
=batch_normalization_assignmovingavg_1_readvariableop_resource:G
9batch_normalization_batchnorm_mul_readvariableop_resource:C
5batch_normalization_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2Ґadd_2/ReadVariableOpҐ#batch_normalization/AssignMovingAvgҐ2batch_normalization/AssignMovingAvg/ReadVariableOpҐ%batch_normalization/AssignMovingAvg_1Ґ4batch_normalization/AssignMovingAvg_1/ReadVariableOpҐ,batch_normalization/batchnorm/ReadVariableOpҐ0batch_normalization/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€|
2batch_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ±
 batch_normalization/moments/meanMeanBiasAdd:output:0;batch_normalization/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(М
(batch_normalization/moments/StopGradientStopGradient)batch_normalization/moments/mean:output:0*
T0*
_output_shapes

:є
-batch_normalization/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:01batch_normalization/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€А
6batch_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Џ
$batch_normalization/moments/varianceMean1batch_normalization/moments/SquaredDifference:z:0?batch_normalization/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Х
#batch_normalization/moments/SqueezeSqueeze)batch_normalization/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Ы
%batch_normalization/moments/Squeeze_1Squeeze-batch_normalization/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 n
)batch_normalization/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<™
2batch_normalization/AssignMovingAvg/ReadVariableOpReadVariableOp;batch_normalization_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0љ
'batch_normalization/AssignMovingAvg/subSub:batch_normalization/AssignMovingAvg/ReadVariableOp:value:0,batch_normalization/moments/Squeeze:output:0*
T0*
_output_shapes
:і
'batch_normalization/AssignMovingAvg/mulMul+batch_normalization/AssignMovingAvg/sub:z:02batch_normalization/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:ь
#batch_normalization/AssignMovingAvgAssignSubVariableOp;batch_normalization_assignmovingavg_readvariableop_resource+batch_normalization/AssignMovingAvg/mul:z:03^batch_normalization/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0p
+batch_normalization/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Ѓ
4batch_normalization/AssignMovingAvg_1/ReadVariableOpReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0√
)batch_normalization/AssignMovingAvg_1/subSub<batch_normalization/AssignMovingAvg_1/ReadVariableOp:value:0.batch_normalization/moments/Squeeze_1:output:0*
T0*
_output_shapes
:Ї
)batch_normalization/AssignMovingAvg_1/mulMul-batch_normalization/AssignMovingAvg_1/sub:z:04batch_normalization/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:Д
%batch_normalization/AssignMovingAvg_1AssignSubVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource-batch_normalization/AssignMovingAvg_1/mul:z:05^batch_normalization/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:≠
!batch_normalization/batchnorm/addAddV2.batch_normalization/moments/Squeeze_1:output:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
:x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
:¶
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0∞
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Х
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€§
#batch_normalization/batchnorm/mul_2Mul,batch_normalization/moments/Squeeze:output:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
:Ю
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0ђ
!batch_normalization/batchnorm/subSub4batch_normalization/batchnorm/ReadVariableOp:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Ѓ
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
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
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
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
 ∞
ReadVariableOpReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource&^batch_normalization/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
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
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:И
mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:К
mul_1/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
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
:Ж
add_2/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
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
 *  а@K
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
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
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
 *  а@Q
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
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
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
 *  А?J
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
 *  А?T
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
 *  А?Q
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
:€€€€€€€€€M
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:≤
ReadVariableOp_2ReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource&^batch_normalization/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
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
 *oГ:c
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
:€€€€€€€€€^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Ї
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp$^batch_normalization/AssignMovingAvg3^batch_normalization/AssignMovingAvg/ReadVariableOp&^batch_normalization/AssignMovingAvg_15^batch_normalization/AssignMovingAvg_1/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp1^batch_normalization/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22,
add_2/ReadVariableOpadd_2/ReadVariableOp2J
#batch_normalization/AssignMovingAvg#batch_normalization/AssignMovingAvg2h
2batch_normalization/AssignMovingAvg/ReadVariableOp2batch_normalization/AssignMovingAvg/ReadVariableOp2N
%batch_normalization/AssignMovingAvg_1%batch_normalization/AssignMovingAvg_12l
4batch_normalization/AssignMovingAvg_1/ReadVariableOp4batch_normalization/AssignMovingAvg_1/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
“9
Љ
__inference__traced_save_172885
file_prefix,
(savev2_dense1_kernel_read_readvariableop*
&savev2_dense1_bias_read_readvariableop/
+savev2_dense1_iteration_read_readvariableop	,
(savev2_dense2_kernel_read_readvariableop?
;savev2_dense1_batch_normalization_gamma_read_readvariableop>
:savev2_dense1_batch_normalization_beta_read_readvariableopE
Asavev2_dense1_batch_normalization_moving_mean_read_readvariableopI
Esavev2_dense1_batch_normalization_moving_variance_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop3
/savev2_adam_dense1_kernel_m_read_readvariableop1
-savev2_adam_dense1_bias_m_read_readvariableop3
/savev2_adam_dense2_kernel_m_read_readvariableopF
Bsavev2_adam_dense1_batch_normalization_gamma_m_read_readvariableopE
Asavev2_adam_dense1_batch_normalization_beta_m_read_readvariableop3
/savev2_adam_dense1_kernel_v_read_readvariableop1
-savev2_adam_dense1_bias_v_read_readvariableop3
/savev2_adam_dense2_kernel_v_read_readvariableopF
Bsavev2_adam_dense1_batch_normalization_gamma_v_read_readvariableopE
Asavev2_adam_dense1_batch_normalization_beta_v_read_readvariableop
savev2_const

identity_1ИҐMergeV2Checkpointsw
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
_temp/partБ
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
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: б
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*К
valueАBэB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-0/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH°
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B µ
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0(savev2_dense1_kernel_read_readvariableop&savev2_dense1_bias_read_readvariableop+savev2_dense1_iteration_read_readvariableop(savev2_dense2_kernel_read_readvariableop;savev2_dense1_batch_normalization_gamma_read_readvariableop:savev2_dense1_batch_normalization_beta_read_readvariableopAsavev2_dense1_batch_normalization_moving_mean_read_readvariableopEsavev2_dense1_batch_normalization_moving_variance_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop/savev2_adam_dense1_kernel_m_read_readvariableop-savev2_adam_dense1_bias_m_read_readvariableop/savev2_adam_dense2_kernel_m_read_readvariableopBsavev2_adam_dense1_batch_normalization_gamma_m_read_readvariableopAsavev2_adam_dense1_batch_normalization_beta_m_read_readvariableop/savev2_adam_dense1_kernel_v_read_readvariableop-savev2_adam_dense1_bias_v_read_readvariableop/savev2_adam_dense2_kernel_v_read_readvariableopBsavev2_adam_dense1_batch_normalization_gamma_v_read_readvariableopAsavev2_adam_dense1_batch_normalization_beta_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *(
dtypes
2		Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Л
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

identity_1Identity_1:output:0*™
_input_shapesШ
Х: :	ь:: :::::: : : : : : : :	ь:::::	ь::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	ь: 

_output_shapes
::

_output_shapes
: :$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::	

_output_shapes
: :
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
: :%!

_output_shapes
:	ь: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
::%!

_output_shapes
:	ь: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
::

_output_shapes
: 
њ
ґ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171614
inputs_ 
dense1_171592:	ь
dense1_171594:
dense1_171596:
dense1_171598:
dense1_171600:
dense1_171602:
dense1_171604:	 
dense2_171609:
identityИҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallҐdropout/StatefulPartitionedCallї
dense1/StatefulPartitionedCallStatefulPartitionedCallinputs_dense1_171592dense1_171594dense1_171596dense1_171598dense1_171600dense1_171602dense1_171604*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_171459”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_171122ё
dropout/StatefulPartitionedCallStatefulPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_171281щ
dense2/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense2_171609*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_171172„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_171225o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€™
NoOpNoOp^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall ^dropout/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
П	
©
$__inference_signature_wrapper_171643
inputs_
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
	unknown_6:
identityИҐStatefulPartitionedCallД
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*)
_read_only_resource_inputs
	*-
config_proto

CPU

GPU 2J 8В **
f%R#
!__inference__wrapped_model_170846o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Ј	
ѓ
*__inference_cicada-v1_layer_call_fn_171564
inputs_
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
	unknown_6:
identityИҐStatefulPartitionedCall¶
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171524o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Ґ
ѕ
4__inference_batch_normalization_layer_call_fn_172733

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityИҐStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_170917o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ю
√
B__inference_dense2_layer_call_and_return_conditional_losses_172653

inputs)
readvariableop_resource:
identityИҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2J
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
 *  А?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?D
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
 *  А?V
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
 *  А?R
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
:€€€€€€€€€_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
µН
І

E__inference_cicada-v1_layer_call_and_return_conditional_losses_172217

inputs8
%dense1_matmul_readvariableop_resource:	ь4
&dense1_biasadd_readvariableop_resource:P
Bdense1_batch_normalization_assignmovingavg_readvariableop_resource:R
Ddense1_batch_normalization_assignmovingavg_1_readvariableop_resource:N
@dense1_batch_normalization_batchnorm_mul_readvariableop_resource:J
<dense1_batch_normalization_batchnorm_readvariableop_resource:-
#dense1_assignaddvariableop_resource:	 0
dense2_readvariableop_resource:
identityИҐdense1/AssignAddVariableOpҐdense1/BiasAdd/ReadVariableOpҐdense1/MatMul/ReadVariableOpҐdense1/ReadVariableOpҐdense1/ReadVariableOp_1Ґdense1/ReadVariableOp_2Ґdense1/add_2/ReadVariableOpҐ*dense1/batch_normalization/AssignMovingAvgҐ9dense1/batch_normalization/AssignMovingAvg/ReadVariableOpҐ,dense1/batch_normalization/AssignMovingAvg_1Ґ;dense1/batch_normalization/AssignMovingAvg_1/ReadVariableOpҐ3dense1/batch_normalization/batchnorm/ReadVariableOpҐ7dense1/batch_normalization/batchnorm/mul/ReadVariableOpҐdense1/mul/ReadVariableOpҐdense1/mul_1/ReadVariableOpҐdense1/mul_3/ReadVariableOpҐdense2/ReadVariableOpҐdense2/ReadVariableOp_1Ґdense2/ReadVariableOp_2O
dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 ZГ
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0w
dense1/MatMulMatMulinputs$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€А
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Л
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Г
9dense1/batch_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ∆
'dense1/batch_normalization/moments/meanMeandense1/BiasAdd:output:0Bdense1/batch_normalization/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Ъ
/dense1/batch_normalization/moments/StopGradientStopGradient0dense1/batch_normalization/moments/mean:output:0*
T0*
_output_shapes

:ќ
4dense1/batch_normalization/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:08dense1/batch_normalization/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€З
=dense1/batch_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: п
+dense1/batch_normalization/moments/varianceMean8dense1/batch_normalization/moments/SquaredDifference:z:0Fdense1/batch_normalization/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(£
*dense1/batch_normalization/moments/SqueezeSqueeze0dense1/batch_normalization/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 ©
,dense1/batch_normalization/moments/Squeeze_1Squeeze4dense1/batch_normalization/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 u
0dense1/batch_normalization/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Є
9dense1/batch_normalization/AssignMovingAvg/ReadVariableOpReadVariableOpBdense1_batch_normalization_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0“
.dense1/batch_normalization/AssignMovingAvg/subSubAdense1/batch_normalization/AssignMovingAvg/ReadVariableOp:value:03dense1/batch_normalization/moments/Squeeze:output:0*
T0*
_output_shapes
:…
.dense1/batch_normalization/AssignMovingAvg/mulMul2dense1/batch_normalization/AssignMovingAvg/sub:z:09dense1/batch_normalization/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:Ш
*dense1/batch_normalization/AssignMovingAvgAssignSubVariableOpBdense1_batch_normalization_assignmovingavg_readvariableop_resource2dense1/batch_normalization/AssignMovingAvg/mul:z:0:^dense1/batch_normalization/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0w
2dense1/batch_normalization/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Љ
;dense1/batch_normalization/AssignMovingAvg_1/ReadVariableOpReadVariableOpDdense1_batch_normalization_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0Ў
0dense1/batch_normalization/AssignMovingAvg_1/subSubCdense1/batch_normalization/AssignMovingAvg_1/ReadVariableOp:value:05dense1/batch_normalization/moments/Squeeze_1:output:0*
T0*
_output_shapes
:ѕ
0dense1/batch_normalization/AssignMovingAvg_1/mulMul4dense1/batch_normalization/AssignMovingAvg_1/sub:z:0;dense1/batch_normalization/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:†
,dense1/batch_normalization/AssignMovingAvg_1AssignSubVariableOpDdense1_batch_normalization_assignmovingavg_1_readvariableop_resource4dense1/batch_normalization/AssignMovingAvg_1/mul:z:0<^dense1/batch_normalization/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0o
*dense1/batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:¬
(dense1/batch_normalization/batchnorm/addAddV25dense1/batch_normalization/moments/Squeeze_1:output:03dense1/batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
:Ж
*dense1/batch_normalization/batchnorm/RsqrtRsqrt,dense1/batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
:і
7dense1/batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp@dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0≈
(dense1/batch_normalization/batchnorm/mulMul.dense1/batch_normalization/batchnorm/Rsqrt:y:0?dense1/batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:™
*dense1/batch_normalization/batchnorm/mul_1Muldense1/BiasAdd:output:0,dense1/batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€є
*dense1/batch_normalization/batchnorm/mul_2Mul3dense1/batch_normalization/moments/Squeeze:output:0,dense1/batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
:ђ
3dense1/batch_normalization/batchnorm/ReadVariableOpReadVariableOp<dense1_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0Ѕ
(dense1/batch_normalization/batchnorm/subSub;dense1/batch_normalization/batchnorm/ReadVariableOp:value:0.dense1/batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
:√
*dense1/batch_normalization/batchnorm/add_1AddV2.dense1/batch_normalization/batchnorm/mul_1:z:0,dense1/batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€N
dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 RР
dense1/AssignAddVariableOpAssignAddVariableOp#dense1_assignaddvariableop_resourcedense1/Const:output:0*
_output_shapes
 *
dtype0	o
%dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
dense1/moments/meanMeandense1/BiasAdd:output:0.dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(r
dense1/moments/StopGradientStopGradientdense1/moments/mean:output:0*
T0*
_output_shapes

:¶
 dense1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0$dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
)dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ≥
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
 Б
dense1/moments/Squeeze_1Squeeze dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 ≈
dense1/ReadVariableOpReadVariableOpDdense1_batch_normalization_assignmovingavg_1_readvariableop_resource-^dense1/batch_normalization/AssignMovingAvg_1*
_output_shapes
:*
dtype0Q
dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:n

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
 *oГ:v
dense1/add_1AddV2!dense1/moments/Squeeze_1:output:0dense1/add_1/y:output:0*
T0*
_output_shapes
:N
dense1/Rsqrt_1Rsqrtdense1/add_1:z:0*
T0*
_output_shapes
:Ц
dense1/mul/ReadVariableOpReadVariableOp@dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0k

dense1/mulMuldense1/Rsqrt:y:0!dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ш
dense1/mul_1/ReadVariableOpReadVariableOp@dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
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
:Ф
dense1/add_2/ReadVariableOpReadVariableOp<dense1_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0q
dense1/add_2AddV2dense1/mul_2:z:0#dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:В
dense1/mul_3/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0r
dense1/mul_3Muldense1/mul:z:0#dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьQ
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
 *  а@`

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
 *  А?f
dense1/Pow_1Powdense1/Pow_1/x:output:0dense1/Pow_1/y:output:0*
T0*
_output_shapes
: _
dense1/mul_4Muldense1/mul_3:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьg
dense1/truedivRealDivdense1/mul_4:z:0dense1/Pow_1:z:0*
T0*
_output_shapes
:	ьO

dense1/NegNegdense1/truediv:z:0*
T0*
_output_shapes
:	ьS
dense1/RoundRounddense1/truediv:z:0*
T0*
_output_shapes
:	ьa
dense1/add_3AddV2dense1/Neg:y:0dense1/Round:y:0*
T0*
_output_shapes
:	ь_
dense1/StopGradientStopGradientdense1/add_3:z:0*
T0*
_output_shapes
:	ьq
dense1/add_4AddV2dense1/truediv:z:0dense1/StopGradient:output:0*
T0*
_output_shapes
:	ьD
dense1/Neg_1Negdense1/Pow:z:0*
T0*
_output_shapes
: S
dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
dense1/add_5AddV2dense1/Neg_1:y:0dense1/add_5/y:output:0*
T0*
_output_shapes
: S
dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense1/mul_5Muldense1/mul_5/x:output:0dense1/add_5:z:0*
T0*
_output_shapes
: S
dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?]
dense1/sub_1Subdense1/Pow:z:0dense1/sub_1/y:output:0*
T0*
_output_shapes
: u
dense1/clip_by_value/MinimumMinimumdense1/add_4:z:0dense1/sub_1:z:0*
T0*
_output_shapes
:	ь}
dense1/clip_by_valueMaximum dense1/clip_by_value/Minimum:z:0dense1/mul_5:z:0*
T0*
_output_shapes
:	ьi
dense1/mul_6Muldense1/Pow_1:z:0dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ьg
dense1/truediv_1RealDivdense1/mul_6:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?l
dense1/mul_7Muldense1/mul_7/x:output:0dense1/truediv_1:z:0*
T0*
_output_shapes
:	ьO
dense1/Neg_2Negdense1/mul_3:z:0*
T0*
_output_shapes
:	ьc
dense1/add_6AddV2dense1/Neg_2:y:0dense1/mul_7:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?h
dense1/mul_8Muldense1/mul_8/x:output:0dense1/add_6:z:0*
T0*
_output_shapes
:	ьa
dense1/StopGradient_1StopGradientdense1/mul_8:z:0*
T0*
_output_shapes
:	ьq
dense1/add_7AddV2dense1/mul_3:z:0dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ьS
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
 *  а@f
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
 *  А?c
dense1/add_10AddV2dense1/Neg_4:y:0dense1/add_10/y:output:0*
T0*
_output_shapes
: T
dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?b
dense1/mul_10Muldense1/mul_10/x:output:0dense1/add_10:z:0*
T0*
_output_shapes
: S
dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
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
 *  А?i
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
 *  А?f
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
:e
dense1/MatMul_1MatMulinputsdense1/add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
dense1/add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:x
dense1/add_13AddV2!dense1/moments/Squeeze_1:output:0dense1/add_13/y:output:0*
T0*
_output_shapes
:O
dense1/Rsqrt_2Rsqrtdense1/add_13:z:0*
T0*
_output_shapes
:«
dense1/ReadVariableOp_2ReadVariableOpDdense1_batch_normalization_assignmovingavg_1_readvariableop_resource-^dense1/batch_normalization/AssignMovingAvg_1*
_output_shapes
:*
dtype0T
dense1/add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:v
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
 *oГ:x
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
:€€€€€€€€€s
dense1/BiasAdd_1BiasAdddense1/Mul_15:z:0dense1/add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
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
:€€€€€€€€€_

relu1/ReluReludense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€^
relu1/ones_like/ShapeShapedense1/BiasAdd_1:output:0*
T0*
_output_shapes
:Z
relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Й
relu1/ones_likeFillrelu1/ones_like/Shape:output:0relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/sub_2Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: m
	relu1/mulMulrelu1/ones_like:output:0relu1/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€К
relu1/SelectV2SelectV2relu1/LessEqual:z:0relu1/Relu:activations:0relu1/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_1Muldense1/BiasAdd_1:output:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truedivRealDivrelu1/mul_1:z:0relu1/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€U
	relu1/NegNegrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€Y
relu1/RoundRoundrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
	relu1/addAddV2relu1/Neg:y:0relu1/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€c
relu1/StopGradientStopGradientrelu1/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€v
relu1/add_1AddV2relu1/truediv:z:0relu1/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truediv_1RealDivrelu1/add_1:z:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
relu1/truediv_2RealDivrelu1/truediv_2/x:output:0relu1/Cast:y:0*
T0*
_output_shapes
: R
relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?`
relu1/sub_3Subrelu1/sub_3/x:output:0relu1/truediv_2:z:0*
T0*
_output_shapes
: ~
relu1/clip_by_value/MinimumMinimumrelu1/truediv_1:z:0relu1/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Z
relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    С
relu1/clip_by_valueMaximumrelu1/clip_by_value/Minimum:z:0relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_2Mulrelu1/Cast_1:y:0relu1/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
relu1/Neg_1Negrelu1/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€h
relu1/add_2AddV2relu1/Neg_1:y:0relu1/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
relu1/mul_3Mulrelu1/mul_3/x:output:0relu1/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€g
relu1/StopGradient_1StopGradientrelu1/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€~
relu1/add_3AddV2relu1/SelectV2:output:0relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Z
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%IТ?}
dropout/dropout/MulMulrelu1/add_3:z:0dropout/dropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€T
dropout/dropout/ShapeShaperelu1/add_3:z:0*
T0*
_output_shapes
:Ь
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0c
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Њ
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€Б
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Q
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
 *  А?a
dense2/add_2AddV2dense2/Neg_1:y:0dense2/add_2/y:output:0*
T0*
_output_shapes
: S
dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense2/mul_1Muldense2/mul_1/x:output:0dense2/add_2:z:0*
T0*
_output_shapes
: Q
dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Y

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
 *  А?k
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
 *  А?g
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

:v
dense2/MatMulMatMuldropout/dropout/Mul_1:z:0dense2/add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€O
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
 *  АA_
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
:€€€€€€€€€_
outputs/ReluReludense2/MatMul:product:0*
T0*'
_output_shapes
:€€€€€€€€€^
outputs/ones_like/ShapeShapedense2/MatMul:product:0*
T0*
_output_shapes
:\
outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?П
outputs/ones_likeFill outputs/ones_like/Shape:output:0 outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/sub_2Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: s
outputs/mulMuloutputs/ones_like:output:0outputs/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€Т
outputs/SelectV2SelectV2outputs/LessEqual:z:0outputs/Relu:activations:0outputs/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
outputs/mul_1Muldense2/MatMul:product:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truedivRealDivoutputs/mul_1:z:0outputs/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
outputs/NegNegoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
outputs/RoundRoundoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€j
outputs/addAddV2outputs/Neg:y:0outputs/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€g
outputs/StopGradientStopGradientoutputs/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€|
outputs/add_1AddV2outputs/truediv:z:0outputs/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truediv_1RealDivoutputs/add_1:z:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€X
outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
outputs/truediv_2RealDivoutputs/truediv_2/x:output:0outputs/Cast:y:0*
T0*
_output_shapes
: T
outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
outputs/sub_3Suboutputs/sub_3/x:output:0outputs/truediv_2:z:0*
T0*
_output_shapes
: Д
outputs/clip_by_value/MinimumMinimumoutputs/truediv_1:z:0outputs/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Ч
outputs/clip_by_valueMaximum!outputs/clip_by_value/Minimum:z:0 outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€u
outputs/mul_2Muloutputs/Cast_1:y:0outputs/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
outputs/Neg_1Negoutputs/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€n
outputs/add_2AddV2outputs/Neg_1:y:0outputs/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?s
outputs/mul_3Muloutputs/mul_3/x:output:0outputs/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€k
outputs/StopGradient_1StopGradientoutputs/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Д
outputs/add_3AddV2outputs/SelectV2:output:0outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€`
IdentityIdentityoutputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€ц
NoOpNoOp^dense1/AssignAddVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp^dense1/ReadVariableOp^dense1/ReadVariableOp_1^dense1/ReadVariableOp_2^dense1/add_2/ReadVariableOp+^dense1/batch_normalization/AssignMovingAvg:^dense1/batch_normalization/AssignMovingAvg/ReadVariableOp-^dense1/batch_normalization/AssignMovingAvg_1<^dense1/batch_normalization/AssignMovingAvg_1/ReadVariableOp4^dense1/batch_normalization/batchnorm/ReadVariableOp8^dense1/batch_normalization/batchnorm/mul/ReadVariableOp^dense1/mul/ReadVariableOp^dense1/mul_1/ReadVariableOp^dense1/mul_3/ReadVariableOp^dense2/ReadVariableOp^dense2/ReadVariableOp_1^dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 28
dense1/AssignAddVariableOpdense1/AssignAddVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp2.
dense1/ReadVariableOpdense1/ReadVariableOp22
dense1/ReadVariableOp_1dense1/ReadVariableOp_122
dense1/ReadVariableOp_2dense1/ReadVariableOp_22:
dense1/add_2/ReadVariableOpdense1/add_2/ReadVariableOp2X
*dense1/batch_normalization/AssignMovingAvg*dense1/batch_normalization/AssignMovingAvg2v
9dense1/batch_normalization/AssignMovingAvg/ReadVariableOp9dense1/batch_normalization/AssignMovingAvg/ReadVariableOp2\
,dense1/batch_normalization/AssignMovingAvg_1,dense1/batch_normalization/AssignMovingAvg_12z
;dense1/batch_normalization/AssignMovingAvg_1/ReadVariableOp;dense1/batch_normalization/AssignMovingAvg_1/ReadVariableOp2j
3dense1/batch_normalization/batchnorm/ReadVariableOp3dense1/batch_normalization/batchnorm/ReadVariableOp2r
7dense1/batch_normalization/batchnorm/mul/ReadVariableOp7dense1/batch_normalization/batchnorm/mul/ReadVariableOp26
dense1/mul/ReadVariableOpdense1/mul/ReadVariableOp2:
dense1/mul_1/ReadVariableOpdense1/mul_1/ReadVariableOp2:
dense1/mul_3/ReadVariableOpdense1/mul_3/ReadVariableOp2.
dense2/ReadVariableOpdense2/ReadVariableOp22
dense2/ReadVariableOp_1dense2/ReadVariableOp_122
dense2/ReadVariableOp_2dense2/ReadVariableOp_2:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
≤Т
Р
!__inference__wrapped_model_170846
inputs_B
/cicada_v1_dense1_matmul_readvariableop_resource:	ь>
0cicada_v1_dense1_biasadd_readvariableop_resource:T
Fcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_resource:X
Jcicada_v1_dense1_batch_normalization_batchnorm_mul_readvariableop_resource:V
Hcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_1_resource:V
Hcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_2_resource:7
-cicada_v1_dense1_assignaddvariableop_resource:	 :
(cicada_v1_dense2_readvariableop_resource:
identityИҐ$cicada-v1/dense1/AssignAddVariableOpҐ'cicada-v1/dense1/BiasAdd/ReadVariableOpҐ&cicada-v1/dense1/MatMul/ReadVariableOpҐcicada-v1/dense1/ReadVariableOpҐ!cicada-v1/dense1/ReadVariableOp_1Ґ%cicada-v1/dense1/add_2/ReadVariableOpҐ=cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOpҐ?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_1Ґ?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_2ҐAcicada-v1/dense1/batch_normalization/batchnorm/mul/ReadVariableOpҐ#cicada-v1/dense1/mul/ReadVariableOpҐ%cicada-v1/dense1/mul_1/ReadVariableOpҐ%cicada-v1/dense1/mul_3/ReadVariableOpҐ#cicada-v1/dense1/sub/ReadVariableOpҐcicada-v1/dense2/ReadVariableOpҐ!cicada-v1/dense2/ReadVariableOp_1Ґ!cicada-v1/dense2/ReadVariableOp_2Y
cicada-v1/dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z Ч
&cicada-v1/dense1/MatMul/ReadVariableOpReadVariableOp/cicada_v1_dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0М
cicada-v1/dense1/MatMulMatMulinputs_.cicada-v1/dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Ф
'cicada-v1/dense1/BiasAdd/ReadVariableOpReadVariableOp0cicada_v1_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0©
cicada-v1/dense1/BiasAddBiasAdd!cicada-v1/dense1/MatMul:product:0/cicada-v1/dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ј
=cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOpReadVariableOpFcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0y
4cicada-v1/dense1/batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:ж
2cicada-v1/dense1/batch_normalization/batchnorm/addAddV2Ecicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp:value:0=cicada-v1/dense1/batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
:Ъ
4cicada-v1/dense1/batch_normalization/batchnorm/RsqrtRsqrt6cicada-v1/dense1/batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
:»
Acicada-v1/dense1/batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOpJcicada_v1_dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0г
2cicada-v1/dense1/batch_normalization/batchnorm/mulMul8cicada-v1/dense1/batch_normalization/batchnorm/Rsqrt:y:0Icicada-v1/dense1/batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:»
4cicada-v1/dense1/batch_normalization/batchnorm/mul_1Mul!cicada-v1/dense1/BiasAdd:output:06cicada-v1/dense1/batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€ƒ
?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOpHcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0б
4cicada-v1/dense1/batch_normalization/batchnorm/mul_2MulGcicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_1:value:06cicada-v1/dense1/batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
:ƒ
?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOpHcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0б
2cicada-v1/dense1/batch_normalization/batchnorm/subSubGcicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_2:value:08cicada-v1/dense1/batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
:б
4cicada-v1/dense1/batch_normalization/batchnorm/add_1AddV28cicada-v1/dense1/batch_normalization/batchnorm/mul_1:z:06cicada-v1/dense1/batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€X
cicada-v1/dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R Ѓ
$cicada-v1/dense1/AssignAddVariableOpAssignAddVariableOp-cicada_v1_dense1_assignaddvariableop_resourcecicada-v1/dense1/Const:output:0*
_output_shapes
 *
dtype0	y
/cicada-v1/dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Љ
cicada-v1/dense1/moments/meanMean!cicada-v1/dense1/BiasAdd:output:08cicada-v1/dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Ж
%cicada-v1/dense1/moments/StopGradientStopGradient&cicada-v1/dense1/moments/mean:output:0*
T0*
_output_shapes

:ƒ
*cicada-v1/dense1/moments/SquaredDifferenceSquaredDifference!cicada-v1/dense1/BiasAdd:output:0.cicada-v1/dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€}
3cicada-v1/dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: —
!cicada-v1/dense1/moments/varianceMean.cicada-v1/dense1/moments/SquaredDifference:z:0<cicada-v1/dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(П
 cicada-v1/dense1/moments/SqueezeSqueeze&cicada-v1/dense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Х
"cicada-v1/dense1/moments/Squeeze_1Squeeze*cicada-v1/dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Ґ
cicada-v1/dense1/ReadVariableOpReadVariableOpFcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0[
cicada-v1/dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:М
cicada-v1/dense1/addAddV2'cicada-v1/dense1/ReadVariableOp:value:0cicada-v1/dense1/add/y:output:0*
T0*
_output_shapes
:^
cicada-v1/dense1/RsqrtRsqrtcicada-v1/dense1/add:z:0*
T0*
_output_shapes
:]
cicada-v1/dense1/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Ф
cicada-v1/dense1/add_1AddV2+cicada-v1/dense1/moments/Squeeze_1:output:0!cicada-v1/dense1/add_1/y:output:0*
T0*
_output_shapes
:b
cicada-v1/dense1/Rsqrt_1Rsqrtcicada-v1/dense1/add_1:z:0*
T0*
_output_shapes
:™
#cicada-v1/dense1/mul/ReadVariableOpReadVariableOpJcicada_v1_dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Й
cicada-v1/dense1/mulMulcicada-v1/dense1/Rsqrt:y:0+cicada-v1/dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:ђ
%cicada-v1/dense1/mul_1/ReadVariableOpReadVariableOpJcicada_v1_dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0П
cicada-v1/dense1/mul_1Mulcicada-v1/dense1/Rsqrt_1:y:0-cicada-v1/dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:О
!cicada-v1/dense1/ReadVariableOp_1ReadVariableOp0cicada_v1_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0®
#cicada-v1/dense1/sub/ReadVariableOpReadVariableOpHcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0Ш
cicada-v1/dense1/subSub)cicada-v1/dense1/ReadVariableOp_1:value:0+cicada-v1/dense1/sub/ReadVariableOp:value:0*
T0*
_output_shapes
:v
cicada-v1/dense1/mul_2Mulcicada-v1/dense1/mul:z:0cicada-v1/dense1/sub:z:0*
T0*
_output_shapes
:™
%cicada-v1/dense1/add_2/ReadVariableOpReadVariableOpHcicada_v1_dense1_batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0П
cicada-v1/dense1/add_2AddV2cicada-v1/dense1/mul_2:z:0-cicada-v1/dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:Ц
%cicada-v1/dense1/mul_3/ReadVariableOpReadVariableOp/cicada_v1_dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0Р
cicada-v1/dense1/mul_3Mulcicada-v1/dense1/mul:z:0-cicada-v1/dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ь[
cicada-v1/dense1/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v1/dense1/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@~
cicada-v1/dense1/PowPowcicada-v1/dense1/Pow/x:output:0cicada-v1/dense1/Pow/y:output:0*
T0*
_output_shapes
: ]
cicada-v1/dense1/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v1/dense1/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Д
cicada-v1/dense1/Pow_1Pow!cicada-v1/dense1/Pow_1/x:output:0!cicada-v1/dense1/Pow_1/y:output:0*
T0*
_output_shapes
: }
cicada-v1/dense1/mul_4Mulcicada-v1/dense1/mul_3:z:0cicada-v1/dense1/Pow:z:0*
T0*
_output_shapes
:	ьЕ
cicada-v1/dense1/truedivRealDivcicada-v1/dense1/mul_4:z:0cicada-v1/dense1/Pow_1:z:0*
T0*
_output_shapes
:	ьc
cicada-v1/dense1/NegNegcicada-v1/dense1/truediv:z:0*
T0*
_output_shapes
:	ьg
cicada-v1/dense1/RoundRoundcicada-v1/dense1/truediv:z:0*
T0*
_output_shapes
:	ь
cicada-v1/dense1/add_3AddV2cicada-v1/dense1/Neg:y:0cicada-v1/dense1/Round:y:0*
T0*
_output_shapes
:	ьs
cicada-v1/dense1/StopGradientStopGradientcicada-v1/dense1/add_3:z:0*
T0*
_output_shapes
:	ьП
cicada-v1/dense1/add_4AddV2cicada-v1/dense1/truediv:z:0&cicada-v1/dense1/StopGradient:output:0*
T0*
_output_shapes
:	ьX
cicada-v1/dense1/Neg_1Negcicada-v1/dense1/Pow:z:0*
T0*
_output_shapes
: ]
cicada-v1/dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
cicada-v1/dense1/add_5AddV2cicada-v1/dense1/Neg_1:y:0!cicada-v1/dense1/add_5/y:output:0*
T0*
_output_shapes
: ]
cicada-v1/dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?}
cicada-v1/dense1/mul_5Mul!cicada-v1/dense1/mul_5/x:output:0cicada-v1/dense1/add_5:z:0*
T0*
_output_shapes
: ]
cicada-v1/dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?{
cicada-v1/dense1/sub_1Subcicada-v1/dense1/Pow:z:0!cicada-v1/dense1/sub_1/y:output:0*
T0*
_output_shapes
: У
&cicada-v1/dense1/clip_by_value/MinimumMinimumcicada-v1/dense1/add_4:z:0cicada-v1/dense1/sub_1:z:0*
T0*
_output_shapes
:	ьЫ
cicada-v1/dense1/clip_by_valueMaximum*cicada-v1/dense1/clip_by_value/Minimum:z:0cicada-v1/dense1/mul_5:z:0*
T0*
_output_shapes
:	ьЗ
cicada-v1/dense1/mul_6Mulcicada-v1/dense1/Pow_1:z:0"cicada-v1/dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ьЕ
cicada-v1/dense1/truediv_1RealDivcicada-v1/dense1/mul_6:z:0cicada-v1/dense1/Pow:z:0*
T0*
_output_shapes
:	ь]
cicada-v1/dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?К
cicada-v1/dense1/mul_7Mul!cicada-v1/dense1/mul_7/x:output:0cicada-v1/dense1/truediv_1:z:0*
T0*
_output_shapes
:	ьc
cicada-v1/dense1/Neg_2Negcicada-v1/dense1/mul_3:z:0*
T0*
_output_shapes
:	ьБ
cicada-v1/dense1/add_6AddV2cicada-v1/dense1/Neg_2:y:0cicada-v1/dense1/mul_7:z:0*
T0*
_output_shapes
:	ь]
cicada-v1/dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Ж
cicada-v1/dense1/mul_8Mul!cicada-v1/dense1/mul_8/x:output:0cicada-v1/dense1/add_6:z:0*
T0*
_output_shapes
:	ьu
cicada-v1/dense1/StopGradient_1StopGradientcicada-v1/dense1/mul_8:z:0*
T0*
_output_shapes
:	ьП
cicada-v1/dense1/add_7AddV2cicada-v1/dense1/mul_3:z:0(cicada-v1/dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ь]
cicada-v1/dense1/Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v1/dense1/Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@Д
cicada-v1/dense1/Pow_2Pow!cicada-v1/dense1/Pow_2/x:output:0!cicada-v1/dense1/Pow_2/y:output:0*
T0*
_output_shapes
: ]
cicada-v1/dense1/Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v1/dense1/Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Д
cicada-v1/dense1/Pow_3Pow!cicada-v1/dense1/Pow_3/x:output:0!cicada-v1/dense1/Pow_3/y:output:0*
T0*
_output_shapes
: z
cicada-v1/dense1/mul_9Mulcicada-v1/dense1/add_2:z:0cicada-v1/dense1/Pow_2:z:0*
T0*
_output_shapes
:В
cicada-v1/dense1/truediv_2RealDivcicada-v1/dense1/mul_9:z:0cicada-v1/dense1/Pow_3:z:0*
T0*
_output_shapes
:b
cicada-v1/dense1/Neg_3Negcicada-v1/dense1/truediv_2:z:0*
T0*
_output_shapes
:f
cicada-v1/dense1/Round_1Roundcicada-v1/dense1/truediv_2:z:0*
T0*
_output_shapes
:~
cicada-v1/dense1/add_8AddV2cicada-v1/dense1/Neg_3:y:0cicada-v1/dense1/Round_1:y:0*
T0*
_output_shapes
:p
cicada-v1/dense1/StopGradient_2StopGradientcicada-v1/dense1/add_8:z:0*
T0*
_output_shapes
:О
cicada-v1/dense1/add_9AddV2cicada-v1/dense1/truediv_2:z:0(cicada-v1/dense1/StopGradient_2:output:0*
T0*
_output_shapes
:Z
cicada-v1/dense1/Neg_4Negcicada-v1/dense1/Pow_2:z:0*
T0*
_output_shapes
: ^
cicada-v1/dense1/add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Б
cicada-v1/dense1/add_10AddV2cicada-v1/dense1/Neg_4:y:0"cicada-v1/dense1/add_10/y:output:0*
T0*
_output_shapes
: ^
cicada-v1/dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?А
cicada-v1/dense1/mul_10Mul"cicada-v1/dense1/mul_10/x:output:0cicada-v1/dense1/add_10:z:0*
T0*
_output_shapes
: ]
cicada-v1/dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?}
cicada-v1/dense1/sub_2Subcicada-v1/dense1/Pow_2:z:0!cicada-v1/dense1/sub_2/y:output:0*
T0*
_output_shapes
: Р
(cicada-v1/dense1/clip_by_value_1/MinimumMinimumcicada-v1/dense1/add_9:z:0cicada-v1/dense1/sub_2:z:0*
T0*
_output_shapes
:Ы
 cicada-v1/dense1/clip_by_value_1Maximum,cicada-v1/dense1/clip_by_value_1/Minimum:z:0cicada-v1/dense1/mul_10:z:0*
T0*
_output_shapes
:Е
cicada-v1/dense1/mul_11Mulcicada-v1/dense1/Pow_3:z:0$cicada-v1/dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:Г
cicada-v1/dense1/truediv_3RealDivcicada-v1/dense1/mul_11:z:0cicada-v1/dense1/Pow_2:z:0*
T0*
_output_shapes
:^
cicada-v1/dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?З
cicada-v1/dense1/mul_12Mul"cicada-v1/dense1/mul_12/x:output:0cicada-v1/dense1/truediv_3:z:0*
T0*
_output_shapes
:^
cicada-v1/dense1/Neg_5Negcicada-v1/dense1/add_2:z:0*
T0*
_output_shapes
:~
cicada-v1/dense1/add_11AddV2cicada-v1/dense1/Neg_5:y:0cicada-v1/dense1/mul_12:z:0*
T0*
_output_shapes
:^
cicada-v1/dense1/mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Д
cicada-v1/dense1/mul_13Mul"cicada-v1/dense1/mul_13/x:output:0cicada-v1/dense1/add_11:z:0*
T0*
_output_shapes
:q
cicada-v1/dense1/StopGradient_3StopGradientcicada-v1/dense1/mul_13:z:0*
T0*
_output_shapes
:Л
cicada-v1/dense1/add_12AddV2cicada-v1/dense1/add_2:z:0(cicada-v1/dense1/StopGradient_3:output:0*
T0*
_output_shapes
:z
cicada-v1/dense1/MatMul_1MatMulinputs_cicada-v1/dense1/add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€Щ
cicada-v1/dense1/BiasAdd_1BiasAdd#cicada-v1/dense1/MatMul_1:product:0cicada-v1/dense1/add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€W
cicada-v1/relu1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :W
cicada-v1/relu1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
{
cicada-v1/relu1/PowPowcicada-v1/relu1/Pow/x:output:0cicada-v1/relu1/Pow/y:output:0*
T0*
_output_shapes
: e
cicada-v1/relu1/CastCastcicada-v1/relu1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Y
cicada-v1/relu1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v1/relu1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Б
cicada-v1/relu1/Pow_1Pow cicada-v1/relu1/Pow_1/x:output:0 cicada-v1/relu1/Pow_1/y:output:0*
T0*
_output_shapes
: i
cicada-v1/relu1/Cast_1Castcicada-v1/relu1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v1/relu1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @Z
cicada-v1/relu1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :q
cicada-v1/relu1/Cast_2Cast!cicada-v1/relu1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v1/relu1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   Aw
cicada-v1/relu1/subSubcicada-v1/relu1/Cast_2:y:0cicada-v1/relu1/sub/y:output:0*
T0*
_output_shapes
: v
cicada-v1/relu1/Pow_2Powcicada-v1/relu1/Const:output:0cicada-v1/relu1/sub:z:0*
T0*
_output_shapes
: t
cicada-v1/relu1/sub_1Subcicada-v1/relu1/Cast_1:y:0cicada-v1/relu1/Pow_2:z:0*
T0*
_output_shapes
: Ш
cicada-v1/relu1/LessEqual	LessEqual#cicada-v1/dense1/BiasAdd_1:output:0cicada-v1/relu1/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€s
cicada-v1/relu1/ReluRelu#cicada-v1/dense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€r
cicada-v1/relu1/ones_like/ShapeShape#cicada-v1/dense1/BiasAdd_1:output:0*
T0*
_output_shapes
:d
cicada-v1/relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?І
cicada-v1/relu1/ones_likeFill(cicada-v1/relu1/ones_like/Shape:output:0(cicada-v1/relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€t
cicada-v1/relu1/sub_2Subcicada-v1/relu1/Cast_1:y:0cicada-v1/relu1/Pow_2:z:0*
T0*
_output_shapes
: Л
cicada-v1/relu1/mulMul"cicada-v1/relu1/ones_like:output:0cicada-v1/relu1/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€≤
cicada-v1/relu1/SelectV2SelectV2cicada-v1/relu1/LessEqual:z:0"cicada-v1/relu1/Relu:activations:0cicada-v1/relu1/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€Н
cicada-v1/relu1/mul_1Mul#cicada-v1/dense1/BiasAdd_1:output:0cicada-v1/relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Л
cicada-v1/relu1/truedivRealDivcicada-v1/relu1/mul_1:z:0cicada-v1/relu1/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€i
cicada-v1/relu1/NegNegcicada-v1/relu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€m
cicada-v1/relu1/RoundRoundcicada-v1/relu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€В
cicada-v1/relu1/addAddV2cicada-v1/relu1/Neg:y:0cicada-v1/relu1/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€w
cicada-v1/relu1/StopGradientStopGradientcicada-v1/relu1/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ф
cicada-v1/relu1/add_1AddV2cicada-v1/relu1/truediv:z:0%cicada-v1/relu1/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€Л
cicada-v1/relu1/truediv_1RealDivcicada-v1/relu1/add_1:z:0cicada-v1/relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€`
cicada-v1/relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Е
cicada-v1/relu1/truediv_2RealDiv$cicada-v1/relu1/truediv_2/x:output:0cicada-v1/relu1/Cast:y:0*
T0*
_output_shapes
: \
cicada-v1/relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?~
cicada-v1/relu1/sub_3Sub cicada-v1/relu1/sub_3/x:output:0cicada-v1/relu1/truediv_2:z:0*
T0*
_output_shapes
: Ь
%cicada-v1/relu1/clip_by_value/MinimumMinimumcicada-v1/relu1/truediv_1:z:0cicada-v1/relu1/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
cicada-v1/relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    ѓ
cicada-v1/relu1/clip_by_valueMaximum)cicada-v1/relu1/clip_by_value/Minimum:z:0(cicada-v1/relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€Н
cicada-v1/relu1/mul_2Mulcicada-v1/relu1/Cast_1:y:0!cicada-v1/relu1/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
cicada-v1/relu1/Neg_1Neg!cicada-v1/relu1/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€Ж
cicada-v1/relu1/add_2AddV2cicada-v1/relu1/Neg_1:y:0cicada-v1/relu1/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€\
cicada-v1/relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Л
cicada-v1/relu1/mul_3Mul cicada-v1/relu1/mul_3/x:output:0cicada-v1/relu1/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€{
cicada-v1/relu1/StopGradient_1StopGradientcicada-v1/relu1/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ь
cicada-v1/relu1/add_3AddV2!cicada-v1/relu1/SelectV2:output:0'cicada-v1/relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
cicada-v1/dropout/IdentityIdentitycicada-v1/relu1/add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
cicada-v1/dense2/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v1/dense2/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0A~
cicada-v1/dense2/PowPowcicada-v1/dense2/Pow/x:output:0cicada-v1/dense2/Pow/y:output:0*
T0*
_output_shapes
: ]
cicada-v1/dense2/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v1/dense2/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Д
cicada-v1/dense2/Pow_1Pow!cicada-v1/dense2/Pow_1/x:output:0!cicada-v1/dense2/Pow_1/y:output:0*
T0*
_output_shapes
: И
cicada-v1/dense2/ReadVariableOpReadVariableOp(cicada_v1_dense2_readvariableop_resource*
_output_shapes

:*
dtype0З
cicada-v1/dense2/mulMul'cicada-v1/dense2/ReadVariableOp:value:0cicada-v1/dense2/Pow:z:0*
T0*
_output_shapes

:В
cicada-v1/dense2/truedivRealDivcicada-v1/dense2/mul:z:0cicada-v1/dense2/Pow_1:z:0*
T0*
_output_shapes

:b
cicada-v1/dense2/NegNegcicada-v1/dense2/truediv:z:0*
T0*
_output_shapes

:f
cicada-v1/dense2/RoundRoundcicada-v1/dense2/truediv:z:0*
T0*
_output_shapes

:|
cicada-v1/dense2/addAddV2cicada-v1/dense2/Neg:y:0cicada-v1/dense2/Round:y:0*
T0*
_output_shapes

:p
cicada-v1/dense2/StopGradientStopGradientcicada-v1/dense2/add:z:0*
T0*
_output_shapes

:О
cicada-v1/dense2/add_1AddV2cicada-v1/dense2/truediv:z:0&cicada-v1/dense2/StopGradient:output:0*
T0*
_output_shapes

:X
cicada-v1/dense2/Neg_1Negcicada-v1/dense2/Pow:z:0*
T0*
_output_shapes
: ]
cicada-v1/dense2/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
cicada-v1/dense2/add_2AddV2cicada-v1/dense2/Neg_1:y:0!cicada-v1/dense2/add_2/y:output:0*
T0*
_output_shapes
: ]
cicada-v1/dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?}
cicada-v1/dense2/mul_1Mul!cicada-v1/dense2/mul_1/x:output:0cicada-v1/dense2/add_2:z:0*
T0*
_output_shapes
: [
cicada-v1/dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
cicada-v1/dense2/subSubcicada-v1/dense2/Pow:z:0cicada-v1/dense2/sub/y:output:0*
T0*
_output_shapes
: Р
&cicada-v1/dense2/clip_by_value/MinimumMinimumcicada-v1/dense2/add_1:z:0cicada-v1/dense2/sub:z:0*
T0*
_output_shapes

:Ъ
cicada-v1/dense2/clip_by_valueMaximum*cicada-v1/dense2/clip_by_value/Minimum:z:0cicada-v1/dense2/mul_1:z:0*
T0*
_output_shapes

:Ж
cicada-v1/dense2/mul_2Mulcicada-v1/dense2/Pow_1:z:0"cicada-v1/dense2/clip_by_value:z:0*
T0*
_output_shapes

:Д
cicada-v1/dense2/truediv_1RealDivcicada-v1/dense2/mul_2:z:0cicada-v1/dense2/Pow:z:0*
T0*
_output_shapes

:]
cicada-v1/dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Й
cicada-v1/dense2/mul_3Mul!cicada-v1/dense2/mul_3/x:output:0cicada-v1/dense2/truediv_1:z:0*
T0*
_output_shapes

:К
!cicada-v1/dense2/ReadVariableOp_1ReadVariableOp(cicada_v1_dense2_readvariableop_resource*
_output_shapes

:*
dtype0q
cicada-v1/dense2/Neg_2Neg)cicada-v1/dense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:А
cicada-v1/dense2/add_3AddV2cicada-v1/dense2/Neg_2:y:0cicada-v1/dense2/mul_3:z:0*
T0*
_output_shapes

:]
cicada-v1/dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Е
cicada-v1/dense2/mul_4Mul!cicada-v1/dense2/mul_4/x:output:0cicada-v1/dense2/add_3:z:0*
T0*
_output_shapes

:t
cicada-v1/dense2/StopGradient_1StopGradientcicada-v1/dense2/mul_4:z:0*
T0*
_output_shapes

:К
!cicada-v1/dense2/ReadVariableOp_2ReadVariableOp(cicada_v1_dense2_readvariableop_resource*
_output_shapes

:*
dtype0Э
cicada-v1/dense2/add_4AddV2)cicada-v1/dense2/ReadVariableOp_2:value:0(cicada-v1/dense2/StopGradient_1:output:0*
T0*
_output_shapes

:Ф
cicada-v1/dense2/MatMulMatMul#cicada-v1/dropout/Identity:output:0cicada-v1/dense2/add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€Y
cicada-v1/outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v1/outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :Б
cicada-v1/outputs/PowPow cicada-v1/outputs/Pow/x:output:0 cicada-v1/outputs/Pow/y:output:0*
T0*
_output_shapes
: i
cicada-v1/outputs/CastCastcicada-v1/outputs/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: [
cicada-v1/outputs/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :[
cicada-v1/outputs/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :З
cicada-v1/outputs/Pow_1Pow"cicada-v1/outputs/Pow_1/x:output:0"cicada-v1/outputs/Pow_1/y:output:0*
T0*
_output_shapes
: m
cicada-v1/outputs/Cast_1Castcicada-v1/outputs/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: \
cicada-v1/outputs/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @\
cicada-v1/outputs/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :u
cicada-v1/outputs/Cast_2Cast#cicada-v1/outputs/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: \
cicada-v1/outputs/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  АA}
cicada-v1/outputs/subSubcicada-v1/outputs/Cast_2:y:0 cicada-v1/outputs/sub/y:output:0*
T0*
_output_shapes
: |
cicada-v1/outputs/Pow_2Pow cicada-v1/outputs/Const:output:0cicada-v1/outputs/sub:z:0*
T0*
_output_shapes
: z
cicada-v1/outputs/sub_1Subcicada-v1/outputs/Cast_1:y:0cicada-v1/outputs/Pow_2:z:0*
T0*
_output_shapes
: Ъ
cicada-v1/outputs/LessEqual	LessEqual!cicada-v1/dense2/MatMul:product:0cicada-v1/outputs/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€s
cicada-v1/outputs/ReluRelu!cicada-v1/dense2/MatMul:product:0*
T0*'
_output_shapes
:€€€€€€€€€r
!cicada-v1/outputs/ones_like/ShapeShape!cicada-v1/dense2/MatMul:product:0*
T0*
_output_shapes
:f
!cicada-v1/outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?≠
cicada-v1/outputs/ones_likeFill*cicada-v1/outputs/ones_like/Shape:output:0*cicada-v1/outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€z
cicada-v1/outputs/sub_2Subcicada-v1/outputs/Cast_1:y:0cicada-v1/outputs/Pow_2:z:0*
T0*
_output_shapes
: С
cicada-v1/outputs/mulMul$cicada-v1/outputs/ones_like:output:0cicada-v1/outputs/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ї
cicada-v1/outputs/SelectV2SelectV2cicada-v1/outputs/LessEqual:z:0$cicada-v1/outputs/Relu:activations:0cicada-v1/outputs/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€П
cicada-v1/outputs/mul_1Mul!cicada-v1/dense2/MatMul:product:0cicada-v1/outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€С
cicada-v1/outputs/truedivRealDivcicada-v1/outputs/mul_1:z:0cicada-v1/outputs/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€m
cicada-v1/outputs/NegNegcicada-v1/outputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
cicada-v1/outputs/RoundRoundcicada-v1/outputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€И
cicada-v1/outputs/addAddV2cicada-v1/outputs/Neg:y:0cicada-v1/outputs/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€{
cicada-v1/outputs/StopGradientStopGradientcicada-v1/outputs/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ъ
cicada-v1/outputs/add_1AddV2cicada-v1/outputs/truediv:z:0'cicada-v1/outputs/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€С
cicada-v1/outputs/truediv_1RealDivcicada-v1/outputs/add_1:z:0cicada-v1/outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€b
cicada-v1/outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Л
cicada-v1/outputs/truediv_2RealDiv&cicada-v1/outputs/truediv_2/x:output:0cicada-v1/outputs/Cast:y:0*
T0*
_output_shapes
: ^
cicada-v1/outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Д
cicada-v1/outputs/sub_3Sub"cicada-v1/outputs/sub_3/x:output:0cicada-v1/outputs/truediv_2:z:0*
T0*
_output_shapes
: Ґ
'cicada-v1/outputs/clip_by_value/MinimumMinimumcicada-v1/outputs/truediv_1:z:0cicada-v1/outputs/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€f
!cicada-v1/outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    µ
cicada-v1/outputs/clip_by_valueMaximum+cicada-v1/outputs/clip_by_value/Minimum:z:0*cicada-v1/outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€У
cicada-v1/outputs/mul_2Mulcicada-v1/outputs/Cast_1:y:0#cicada-v1/outputs/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€u
cicada-v1/outputs/Neg_1Neg#cicada-v1/outputs/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€М
cicada-v1/outputs/add_2AddV2cicada-v1/outputs/Neg_1:y:0cicada-v1/outputs/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€^
cicada-v1/outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?С
cicada-v1/outputs/mul_3Mul"cicada-v1/outputs/mul_3/x:output:0cicada-v1/outputs/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€
 cicada-v1/outputs/StopGradient_1StopGradientcicada-v1/outputs/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ґ
cicada-v1/outputs/add_3AddV2#cicada-v1/outputs/SelectV2:output:0)cicada-v1/outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€j
IdentityIdentitycicada-v1/outputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Љ
NoOpNoOp%^cicada-v1/dense1/AssignAddVariableOp(^cicada-v1/dense1/BiasAdd/ReadVariableOp'^cicada-v1/dense1/MatMul/ReadVariableOp ^cicada-v1/dense1/ReadVariableOp"^cicada-v1/dense1/ReadVariableOp_1&^cicada-v1/dense1/add_2/ReadVariableOp>^cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp@^cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_1@^cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_2B^cicada-v1/dense1/batch_normalization/batchnorm/mul/ReadVariableOp$^cicada-v1/dense1/mul/ReadVariableOp&^cicada-v1/dense1/mul_1/ReadVariableOp&^cicada-v1/dense1/mul_3/ReadVariableOp$^cicada-v1/dense1/sub/ReadVariableOp ^cicada-v1/dense2/ReadVariableOp"^cicada-v1/dense2/ReadVariableOp_1"^cicada-v1/dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 2L
$cicada-v1/dense1/AssignAddVariableOp$cicada-v1/dense1/AssignAddVariableOp2R
'cicada-v1/dense1/BiasAdd/ReadVariableOp'cicada-v1/dense1/BiasAdd/ReadVariableOp2P
&cicada-v1/dense1/MatMul/ReadVariableOp&cicada-v1/dense1/MatMul/ReadVariableOp2B
cicada-v1/dense1/ReadVariableOpcicada-v1/dense1/ReadVariableOp2F
!cicada-v1/dense1/ReadVariableOp_1!cicada-v1/dense1/ReadVariableOp_12N
%cicada-v1/dense1/add_2/ReadVariableOp%cicada-v1/dense1/add_2/ReadVariableOp2~
=cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp=cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp2В
?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_1?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_12В
?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_2?cicada-v1/dense1/batch_normalization/batchnorm/ReadVariableOp_22Ж
Acicada-v1/dense1/batch_normalization/batchnorm/mul/ReadVariableOpAcicada-v1/dense1/batch_normalization/batchnorm/mul/ReadVariableOp2J
#cicada-v1/dense1/mul/ReadVariableOp#cicada-v1/dense1/mul/ReadVariableOp2N
%cicada-v1/dense1/mul_1/ReadVariableOp%cicada-v1/dense1/mul_1/ReadVariableOp2N
%cicada-v1/dense1/mul_3/ReadVariableOp%cicada-v1/dense1/mul_3/ReadVariableOp2J
#cicada-v1/dense1/sub/ReadVariableOp#cicada-v1/dense1/sub/ReadVariableOp2B
cicada-v1/dense2/ReadVariableOpcicada-v1/dense2/ReadVariableOp2F
!cicada-v1/dense2/ReadVariableOp_1!cicada-v1/dense2/ReadVariableOp_12F
!cicada-v1/dense2/ReadVariableOp_2!cicada-v1/dense2/ReadVariableOp_2:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Р%
и
O__inference_batch_normalization_layer_call_and_return_conditional_losses_170917

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identityИҐAssignMovingAvgҐAssignMovingAvg/ReadVariableOpҐAssignMovingAvg_1Ґ AssignMovingAvg_1/ReadVariableOpҐbatchnorm/ReadVariableOpҐbatchnorm/mul/ReadVariableOph
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

:З
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
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
„#<В
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0Б
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:ђ
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
„#<Ж
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0З
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:і
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:q
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
:€€€€€€€€€h
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
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€к
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
і	
Ѓ
*__inference_cicada-v1_layer_call_fn_171685

inputs
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
	unknown_6:
identityИҐStatefulPartitionedCall•
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171524o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
°
Ф
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171589
inputs_ 
dense1_171567:	ь
dense1_171569:
dense1_171571:
dense1_171573:
dense1_171575:
dense1_171577:
dense1_171579:	 
dense2_171584:
identityИҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallљ
dense1/StatefulPartitionedCallStatefulPartitionedCallinputs_dense1_171567dense1_171569dense1_171571dense1_171573dense1_171575dense1_171577dense1_171579*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_171057”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_171122ќ
dropout/PartitionedCallPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_171129с
dense2/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense2_171584*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_171172„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_171225o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€И
NoOpNoOp^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Ч
B
&__inference_relu1_layer_call_fn_172529

inputs
identityђ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_171122`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
н
a
(__inference_dropout_layer_call_fn_172588

inputs
identityИҐStatefulPartitionedCallЊ
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_171281o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
÷
a
C__inference_dropout_layer_call_and_return_conditional_losses_171129

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Д	
О
'__inference_dense1_layer_call_fn_172236

inputs
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identityИҐStatefulPartitionedCallЧ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_171057o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
еб
є	
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171935

inputs8
%dense1_matmul_readvariableop_resource:	ь4
&dense1_biasadd_readvariableop_resource:J
<dense1_batch_normalization_batchnorm_readvariableop_resource:N
@dense1_batch_normalization_batchnorm_mul_readvariableop_resource:L
>dense1_batch_normalization_batchnorm_readvariableop_1_resource:L
>dense1_batch_normalization_batchnorm_readvariableop_2_resource:-
#dense1_assignaddvariableop_resource:	 0
dense2_readvariableop_resource:
identityИҐdense1/AssignAddVariableOpҐdense1/BiasAdd/ReadVariableOpҐdense1/MatMul/ReadVariableOpҐdense1/ReadVariableOpҐdense1/ReadVariableOp_1Ґdense1/add_2/ReadVariableOpҐ3dense1/batch_normalization/batchnorm/ReadVariableOpҐ5dense1/batch_normalization/batchnorm/ReadVariableOp_1Ґ5dense1/batch_normalization/batchnorm/ReadVariableOp_2Ґ7dense1/batch_normalization/batchnorm/mul/ReadVariableOpҐdense1/mul/ReadVariableOpҐdense1/mul_1/ReadVariableOpҐdense1/mul_3/ReadVariableOpҐdense1/sub/ReadVariableOpҐdense2/ReadVariableOpҐdense2/ReadVariableOp_1Ґdense2/ReadVariableOp_2O
dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z Г
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0w
dense1/MatMulMatMulinputs$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€А
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Л
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ђ
3dense1/batch_normalization/batchnorm/ReadVariableOpReadVariableOp<dense1_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0o
*dense1/batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:»
(dense1/batch_normalization/batchnorm/addAddV2;dense1/batch_normalization/batchnorm/ReadVariableOp:value:03dense1/batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
:Ж
*dense1/batch_normalization/batchnorm/RsqrtRsqrt,dense1/batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
:і
7dense1/batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp@dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0≈
(dense1/batch_normalization/batchnorm/mulMul.dense1/batch_normalization/batchnorm/Rsqrt:y:0?dense1/batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:™
*dense1/batch_normalization/batchnorm/mul_1Muldense1/BiasAdd:output:0,dense1/batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€∞
5dense1/batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOp>dense1_batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0√
*dense1/batch_normalization/batchnorm/mul_2Mul=dense1/batch_normalization/batchnorm/ReadVariableOp_1:value:0,dense1/batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
:∞
5dense1/batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOp>dense1_batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0√
(dense1/batch_normalization/batchnorm/subSub=dense1/batch_normalization/batchnorm/ReadVariableOp_2:value:0.dense1/batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
:√
*dense1/batch_normalization/batchnorm/add_1AddV2.dense1/batch_normalization/batchnorm/mul_1:z:0,dense1/batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€N
dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R Р
dense1/AssignAddVariableOpAssignAddVariableOp#dense1_assignaddvariableop_resourcedense1/Const:output:0*
_output_shapes
 *
dtype0	o
%dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
dense1/moments/meanMeandense1/BiasAdd:output:0.dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(r
dense1/moments/StopGradientStopGradientdense1/moments/mean:output:0*
T0*
_output_shapes

:¶
 dense1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0$dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
)dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ≥
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
 Б
dense1/moments/Squeeze_1Squeeze dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 О
dense1/ReadVariableOpReadVariableOp<dense1_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0Q
dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:n

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
 *oГ:v
dense1/add_1AddV2!dense1/moments/Squeeze_1:output:0dense1/add_1/y:output:0*
T0*
_output_shapes
:N
dense1/Rsqrt_1Rsqrtdense1/add_1:z:0*
T0*
_output_shapes
:Ц
dense1/mul/ReadVariableOpReadVariableOp@dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0k

dense1/mulMuldense1/Rsqrt:y:0!dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ш
dense1/mul_1/ReadVariableOpReadVariableOp@dense1_batch_normalization_batchnorm_mul_readvariableop_resource*
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
dtype0Ф
dense1/sub/ReadVariableOpReadVariableOp>dense1_batch_normalization_batchnorm_readvariableop_1_resource*
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
:Ц
dense1/add_2/ReadVariableOpReadVariableOp>dense1_batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0q
dense1/add_2AddV2dense1/mul_2:z:0#dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:В
dense1/mul_3/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0r
dense1/mul_3Muldense1/mul:z:0#dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьQ
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
 *  а@`

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
 *  А?f
dense1/Pow_1Powdense1/Pow_1/x:output:0dense1/Pow_1/y:output:0*
T0*
_output_shapes
: _
dense1/mul_4Muldense1/mul_3:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьg
dense1/truedivRealDivdense1/mul_4:z:0dense1/Pow_1:z:0*
T0*
_output_shapes
:	ьO

dense1/NegNegdense1/truediv:z:0*
T0*
_output_shapes
:	ьS
dense1/RoundRounddense1/truediv:z:0*
T0*
_output_shapes
:	ьa
dense1/add_3AddV2dense1/Neg:y:0dense1/Round:y:0*
T0*
_output_shapes
:	ь_
dense1/StopGradientStopGradientdense1/add_3:z:0*
T0*
_output_shapes
:	ьq
dense1/add_4AddV2dense1/truediv:z:0dense1/StopGradient:output:0*
T0*
_output_shapes
:	ьD
dense1/Neg_1Negdense1/Pow:z:0*
T0*
_output_shapes
: S
dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
dense1/add_5AddV2dense1/Neg_1:y:0dense1/add_5/y:output:0*
T0*
_output_shapes
: S
dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense1/mul_5Muldense1/mul_5/x:output:0dense1/add_5:z:0*
T0*
_output_shapes
: S
dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?]
dense1/sub_1Subdense1/Pow:z:0dense1/sub_1/y:output:0*
T0*
_output_shapes
: u
dense1/clip_by_value/MinimumMinimumdense1/add_4:z:0dense1/sub_1:z:0*
T0*
_output_shapes
:	ь}
dense1/clip_by_valueMaximum dense1/clip_by_value/Minimum:z:0dense1/mul_5:z:0*
T0*
_output_shapes
:	ьi
dense1/mul_6Muldense1/Pow_1:z:0dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ьg
dense1/truediv_1RealDivdense1/mul_6:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?l
dense1/mul_7Muldense1/mul_7/x:output:0dense1/truediv_1:z:0*
T0*
_output_shapes
:	ьO
dense1/Neg_2Negdense1/mul_3:z:0*
T0*
_output_shapes
:	ьc
dense1/add_6AddV2dense1/Neg_2:y:0dense1/mul_7:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?h
dense1/mul_8Muldense1/mul_8/x:output:0dense1/add_6:z:0*
T0*
_output_shapes
:	ьa
dense1/StopGradient_1StopGradientdense1/mul_8:z:0*
T0*
_output_shapes
:	ьq
dense1/add_7AddV2dense1/mul_3:z:0dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ьS
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
 *  а@f
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
 *  А?c
dense1/add_10AddV2dense1/Neg_4:y:0dense1/add_10/y:output:0*
T0*
_output_shapes
: T
dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?b
dense1/mul_10Muldense1/mul_10/x:output:0dense1/add_10:z:0*
T0*
_output_shapes
: S
dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
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
 *  А?i
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
 *  А?f
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
:e
dense1/MatMul_1MatMulinputsdense1/add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€{
dense1/BiasAdd_1BiasAdddense1/MatMul_1:product:0dense1/add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
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
:€€€€€€€€€_

relu1/ReluReludense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€^
relu1/ones_like/ShapeShapedense1/BiasAdd_1:output:0*
T0*
_output_shapes
:Z
relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Й
relu1/ones_likeFillrelu1/ones_like/Shape:output:0relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/sub_2Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: m
	relu1/mulMulrelu1/ones_like:output:0relu1/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€К
relu1/SelectV2SelectV2relu1/LessEqual:z:0relu1/Relu:activations:0relu1/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_1Muldense1/BiasAdd_1:output:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truedivRealDivrelu1/mul_1:z:0relu1/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€U
	relu1/NegNegrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€Y
relu1/RoundRoundrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
	relu1/addAddV2relu1/Neg:y:0relu1/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€c
relu1/StopGradientStopGradientrelu1/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€v
relu1/add_1AddV2relu1/truediv:z:0relu1/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truediv_1RealDivrelu1/add_1:z:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
relu1/truediv_2RealDivrelu1/truediv_2/x:output:0relu1/Cast:y:0*
T0*
_output_shapes
: R
relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?`
relu1/sub_3Subrelu1/sub_3/x:output:0relu1/truediv_2:z:0*
T0*
_output_shapes
: ~
relu1/clip_by_value/MinimumMinimumrelu1/truediv_1:z:0relu1/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Z
relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    С
relu1/clip_by_valueMaximumrelu1/clip_by_value/Minimum:z:0relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_2Mulrelu1/Cast_1:y:0relu1/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
relu1/Neg_1Negrelu1/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€h
relu1/add_2AddV2relu1/Neg_1:y:0relu1/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
relu1/mul_3Mulrelu1/mul_3/x:output:0relu1/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€g
relu1/StopGradient_1StopGradientrelu1/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€~
relu1/add_3AddV2relu1/SelectV2:output:0relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€_
dropout/IdentityIdentityrelu1/add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
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
 *  А?a
dense2/add_2AddV2dense2/Neg_1:y:0dense2/add_2/y:output:0*
T0*
_output_shapes
: S
dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense2/mul_1Muldense2/mul_1/x:output:0dense2/add_2:z:0*
T0*
_output_shapes
: Q
dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Y

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
 *  А?k
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
 *  А?g
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

:v
dense2/MatMulMatMuldropout/Identity:output:0dense2/add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€O
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
 *  АA_
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
:€€€€€€€€€_
outputs/ReluReludense2/MatMul:product:0*
T0*'
_output_shapes
:€€€€€€€€€^
outputs/ones_like/ShapeShapedense2/MatMul:product:0*
T0*
_output_shapes
:\
outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?П
outputs/ones_likeFill outputs/ones_like/Shape:output:0 outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/sub_2Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: s
outputs/mulMuloutputs/ones_like:output:0outputs/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€Т
outputs/SelectV2SelectV2outputs/LessEqual:z:0outputs/Relu:activations:0outputs/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
outputs/mul_1Muldense2/MatMul:product:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truedivRealDivoutputs/mul_1:z:0outputs/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
outputs/NegNegoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
outputs/RoundRoundoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€j
outputs/addAddV2outputs/Neg:y:0outputs/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€g
outputs/StopGradientStopGradientoutputs/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€|
outputs/add_1AddV2outputs/truediv:z:0outputs/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truediv_1RealDivoutputs/add_1:z:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€X
outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
outputs/truediv_2RealDivoutputs/truediv_2/x:output:0outputs/Cast:y:0*
T0*
_output_shapes
: T
outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
outputs/sub_3Suboutputs/sub_3/x:output:0outputs/truediv_2:z:0*
T0*
_output_shapes
: Д
outputs/clip_by_value/MinimumMinimumoutputs/truediv_1:z:0outputs/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Ч
outputs/clip_by_valueMaximum!outputs/clip_by_value/Minimum:z:0 outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€u
outputs/mul_2Muloutputs/Cast_1:y:0outputs/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
outputs/Neg_1Negoutputs/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€n
outputs/add_2AddV2outputs/Neg_1:y:0outputs/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?s
outputs/mul_3Muloutputs/mul_3/x:output:0outputs/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€k
outputs/StopGradient_1StopGradientoutputs/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Д
outputs/add_3AddV2outputs/SelectV2:output:0outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€`
IdentityIdentityoutputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Т
NoOpNoOp^dense1/AssignAddVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp^dense1/ReadVariableOp^dense1/ReadVariableOp_1^dense1/add_2/ReadVariableOp4^dense1/batch_normalization/batchnorm/ReadVariableOp6^dense1/batch_normalization/batchnorm/ReadVariableOp_16^dense1/batch_normalization/batchnorm/ReadVariableOp_28^dense1/batch_normalization/batchnorm/mul/ReadVariableOp^dense1/mul/ReadVariableOp^dense1/mul_1/ReadVariableOp^dense1/mul_3/ReadVariableOp^dense1/sub/ReadVariableOp^dense2/ReadVariableOp^dense2/ReadVariableOp_1^dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 28
dense1/AssignAddVariableOpdense1/AssignAddVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp2.
dense1/ReadVariableOpdense1/ReadVariableOp22
dense1/ReadVariableOp_1dense1/ReadVariableOp_12:
dense1/add_2/ReadVariableOpdense1/add_2/ReadVariableOp2j
3dense1/batch_normalization/batchnorm/ReadVariableOp3dense1/batch_normalization/batchnorm/ReadVariableOp2n
5dense1/batch_normalization/batchnorm/ReadVariableOp_15dense1/batch_normalization/batchnorm/ReadVariableOp_12n
5dense1/batch_normalization/batchnorm/ReadVariableOp_25dense1/batch_normalization/batchnorm/ReadVariableOp_22r
7dense1/batch_normalization/batchnorm/mul/ReadVariableOp7dense1/batch_normalization/batchnorm/mul/ReadVariableOp26
dense1/mul/ReadVariableOpdense1/mul/ReadVariableOp2:
dense1/mul_1/ReadVariableOpdense1/mul_1/ReadVariableOp2:
dense1/mul_3/ReadVariableOpdense1/mul_3/ReadVariableOp26
dense1/sub/ReadVariableOpdense1/sub/ReadVariableOp2.
dense2/ReadVariableOpdense2/ReadVariableOp22
dense2/ReadVariableOp_1dense2/ReadVariableOp_122
dense2/ReadVariableOp_2dense2/ReadVariableOp_2:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
ю
√
B__inference_dense2_layer_call_and_return_conditional_losses_171172

inputs)
readvariableop_resource:
identityИҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2J
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
 *  А?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?D
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
 *  А?V
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
 *  А?R
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
:€€€€€€€€€_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
с	
b
C__inference_dropout_layer_call_and_return_conditional_losses_172605

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%IТ?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ю
У
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171228

inputs 
dense1_171058:	ь
dense1_171060:
dense1_171062:
dense1_171064:
dense1_171066:
dense1_171068:
dense1_171070:	 
dense2_171173:
identityИҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallЉ
dense1/StatefulPartitionedCallStatefulPartitionedCallinputsdense1_171058dense1_171060dense1_171062dense1_171064dense1_171066dense1_171068dense1_171070*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_171057”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_171122ќ
dropout/PartitionedCallPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_171129с
dense2/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense2_171173*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_171172„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_171225o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€И
NoOpNoOp^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
Љ
µ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171524

inputs 
dense1_171502:	ь
dense1_171504:
dense1_171506:
dense1_171508:
dense1_171510:
dense1_171512:
dense1_171514:	 
dense2_171519:
identityИҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallҐdropout/StatefulPartitionedCallЇ
dense1/StatefulPartitionedCallStatefulPartitionedCallinputsdense1_171502dense1_171504dense1_171506dense1_171508dense1_171510dense1_171512dense1_171514*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_171459”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_171122ё
dropout/StatefulPartitionedCallStatefulPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_171281щ
dense2/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense2_171519*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_171172„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_171225o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€™
NoOpNoOp^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall ^dropout/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:€€€€€€€€€ь: : : : : : : : 2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
Пf
н
"__inference__traced_restore_172970
file_prefix1
assignvariableop_dense1_kernel:	ь,
assignvariableop_1_dense1_bias:-
#assignvariableop_2_dense1_iteration:	 2
 assignvariableop_3_dense2_kernel:A
3assignvariableop_4_dense1_batch_normalization_gamma:@
2assignvariableop_5_dense1_batch_normalization_beta:G
9assignvariableop_6_dense1_batch_normalization_moving_mean:K
=assignvariableop_7_dense1_batch_normalization_moving_variance:&
assignvariableop_8_adam_iter:	 (
assignvariableop_9_adam_beta_1: )
assignvariableop_10_adam_beta_2: (
assignvariableop_11_adam_decay: 0
&assignvariableop_12_adam_learning_rate: #
assignvariableop_13_total: #
assignvariableop_14_count: ;
(assignvariableop_15_adam_dense1_kernel_m:	ь4
&assignvariableop_16_adam_dense1_bias_m::
(assignvariableop_17_adam_dense2_kernel_m:I
;assignvariableop_18_adam_dense1_batch_normalization_gamma_m:H
:assignvariableop_19_adam_dense1_batch_normalization_beta_m:;
(assignvariableop_20_adam_dense1_kernel_v:	ь4
&assignvariableop_21_adam_dense1_bias_v::
(assignvariableop_22_adam_dense2_kernel_v:I
;assignvariableop_23_adam_dense1_batch_normalization_gamma_v:H
:assignvariableop_24_adam_dense1_batch_normalization_beta_v:
identity_26ИҐAssignVariableOpҐAssignVariableOp_1ҐAssignVariableOp_10ҐAssignVariableOp_11ҐAssignVariableOp_12ҐAssignVariableOp_13ҐAssignVariableOp_14ҐAssignVariableOp_15ҐAssignVariableOp_16ҐAssignVariableOp_17ҐAssignVariableOp_18ҐAssignVariableOp_19ҐAssignVariableOp_2ҐAssignVariableOp_20ҐAssignVariableOp_21ҐAssignVariableOp_22ҐAssignVariableOp_23ҐAssignVariableOp_24ҐAssignVariableOp_3ҐAssignVariableOp_4ҐAssignVariableOp_5ҐAssignVariableOp_6ҐAssignVariableOp_7ҐAssignVariableOp_8ҐAssignVariableOp_9д
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*К
valueАBэB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-0/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH§
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B †
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*|
_output_shapesj
h::::::::::::::::::::::::::*(
dtypes
2		[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:Й
AssignVariableOpAssignVariableOpassignvariableop_dense1_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense1_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0	*
_output_shapes
:Т
AssignVariableOp_2AssignVariableOp#assignvariableop_2_dense1_iterationIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_3AssignVariableOp assignvariableop_3_dense2_kernelIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:Ґ
AssignVariableOp_4AssignVariableOp3assignvariableop_4_dense1_batch_normalization_gammaIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:°
AssignVariableOp_5AssignVariableOp2assignvariableop_5_dense1_batch_normalization_betaIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:®
AssignVariableOp_6AssignVariableOp9assignvariableop_6_dense1_batch_normalization_moving_meanIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:ђ
AssignVariableOp_7AssignVariableOp=assignvariableop_7_dense1_batch_normalization_moving_varianceIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0	*
_output_shapes
:Л
AssignVariableOp_8AssignVariableOpassignvariableop_8_adam_iterIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_9AssignVariableOpassignvariableop_9_adam_beta_1Identity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_beta_2Identity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_decayIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_12AssignVariableOp&assignvariableop_12_adam_learning_rateIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_13AssignVariableOpassignvariableop_13_totalIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_14AssignVariableOpassignvariableop_14_countIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_15AssignVariableOp(assignvariableop_15_adam_dense1_kernel_mIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_16AssignVariableOp&assignvariableop_16_adam_dense1_bias_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_17AssignVariableOp(assignvariableop_17_adam_dense2_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:ђ
AssignVariableOp_18AssignVariableOp;assignvariableop_18_adam_dense1_batch_normalization_gamma_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:Ђ
AssignVariableOp_19AssignVariableOp:assignvariableop_19_adam_dense1_batch_normalization_beta_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_20AssignVariableOp(assignvariableop_20_adam_dense1_kernel_vIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_21AssignVariableOp&assignvariableop_21_adam_dense1_bias_vIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_22AssignVariableOp(assignvariableop_22_adam_dense2_kernel_vIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:ђ
AssignVariableOp_23AssignVariableOp;assignvariableop_23_adam_dense1_batch_normalization_gamma_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:Ђ
AssignVariableOp_24AssignVariableOp:assignvariableop_24_adam_dense1_batch_normalization_beta_vIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 х
Identity_25Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_26IdentityIdentity_25:output:0^NoOp_1*
T0*
_output_shapes
: в
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_26Identity_26:output:0*G
_input_shapes6
4: : : : : : : : : : : : : : : : : : : : : : : : : : 2$
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
AssignVariableOp_24AssignVariableOp_242(
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
х 
_
C__inference_outputs_layer_call_and_return_conditional_losses_172707

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
 *  АAG
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
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Х
{
'__inference_dense2_layer_call_fn_172612

inputs
unknown:
identityИҐStatefulPartitionedCall 
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_171172o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ќЙ
Е
B__inference_dense1_layer_call_and_return_conditional_losses_171459

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:I
;batch_normalization_assignmovingavg_readvariableop_resource:K
=batch_normalization_assignmovingavg_1_readvariableop_resource:G
9batch_normalization_batchnorm_mul_readvariableop_resource:C
5batch_normalization_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2Ґadd_2/ReadVariableOpҐ#batch_normalization/AssignMovingAvgҐ2batch_normalization/AssignMovingAvg/ReadVariableOpҐ%batch_normalization/AssignMovingAvg_1Ґ4batch_normalization/AssignMovingAvg_1/ReadVariableOpҐ,batch_normalization/batchnorm/ReadVariableOpҐ0batch_normalization/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€|
2batch_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ±
 batch_normalization/moments/meanMeanBiasAdd:output:0;batch_normalization/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(М
(batch_normalization/moments/StopGradientStopGradient)batch_normalization/moments/mean:output:0*
T0*
_output_shapes

:є
-batch_normalization/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:01batch_normalization/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€А
6batch_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Џ
$batch_normalization/moments/varianceMean1batch_normalization/moments/SquaredDifference:z:0?batch_normalization/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Х
#batch_normalization/moments/SqueezeSqueeze)batch_normalization/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Ы
%batch_normalization/moments/Squeeze_1Squeeze-batch_normalization/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 n
)batch_normalization/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<™
2batch_normalization/AssignMovingAvg/ReadVariableOpReadVariableOp;batch_normalization_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0љ
'batch_normalization/AssignMovingAvg/subSub:batch_normalization/AssignMovingAvg/ReadVariableOp:value:0,batch_normalization/moments/Squeeze:output:0*
T0*
_output_shapes
:і
'batch_normalization/AssignMovingAvg/mulMul+batch_normalization/AssignMovingAvg/sub:z:02batch_normalization/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:ь
#batch_normalization/AssignMovingAvgAssignSubVariableOp;batch_normalization_assignmovingavg_readvariableop_resource+batch_normalization/AssignMovingAvg/mul:z:03^batch_normalization/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0p
+batch_normalization/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Ѓ
4batch_normalization/AssignMovingAvg_1/ReadVariableOpReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0√
)batch_normalization/AssignMovingAvg_1/subSub<batch_normalization/AssignMovingAvg_1/ReadVariableOp:value:0.batch_normalization/moments/Squeeze_1:output:0*
T0*
_output_shapes
:Ї
)batch_normalization/AssignMovingAvg_1/mulMul-batch_normalization/AssignMovingAvg_1/sub:z:04batch_normalization/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:Д
%batch_normalization/AssignMovingAvg_1AssignSubVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource-batch_normalization/AssignMovingAvg_1/mul:z:05^batch_normalization/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:≠
!batch_normalization/batchnorm/addAddV2.batch_normalization/moments/Squeeze_1:output:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
:x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
:¶
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0∞
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Х
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€§
#batch_normalization/batchnorm/mul_2Mul,batch_normalization/moments/Squeeze:output:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
:Ю
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0ђ
!batch_normalization/batchnorm/subSub4batch_normalization/batchnorm/ReadVariableOp:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
:Ѓ
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
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
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
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
 ∞
ReadVariableOpReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource&^batch_normalization/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
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
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:И
mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:К
mul_1/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
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
:Ж
add_2/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
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
 *  а@K
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
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
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
 *  а@Q
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
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
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
 *  А?J
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
 *  А?T
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
 *  А?Q
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
:€€€€€€€€€M
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:≤
ReadVariableOp_2ReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource&^batch_normalization/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
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
 *oГ:c
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
:€€€€€€€€€^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Ї
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp$^batch_normalization/AssignMovingAvg3^batch_normalization/AssignMovingAvg/ReadVariableOp&^batch_normalization/AssignMovingAvg_15^batch_normalization/AssignMovingAvg_1/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp1^batch_normalization/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22,
add_2/ReadVariableOpadd_2/ReadVariableOp2J
#batch_normalization/AssignMovingAvg#batch_normalization/AssignMovingAvg2h
2batch_normalization/AssignMovingAvg/ReadVariableOp2batch_normalization/AssignMovingAvg/ReadVariableOp2N
%batch_normalization/AssignMovingAvg_1%batch_normalization/AssignMovingAvg_12l
4batch_normalization/AssignMovingAvg_1/ReadVariableOp4batch_normalization/AssignMovingAvg_1/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
§
ѕ
4__inference_batch_normalization_layer_call_fn_172720

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityИҐStatefulPartitionedCallю
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_170870o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs"µ	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ђ
serving_defaultЧ
<
inputs_1
serving_default_inputs_:0€€€€€€€€€ь;
outputs0
StatefulPartitionedCall:0€€€€€€€€€tensorflow/serving/predict:Лї
е
layer-0
layer_with_weights-0
layer-1
layer-2
layer-3
layer_with_weights-1
layer-4
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
–
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
kernel_quantizer
bias_quantizer
kernel_quantizer_internal
bias_quantizer_internal

quantizers
	batchnorm

kernel
bias

_iteration"
_tf_keras_layer
і
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses
#	quantizer"
_tf_keras_layer
Љ
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
*_random_generator"
_tf_keras_layer
ц
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses
1kernel_quantizer
1kernel_quantizer_internal
2
quantizers

3kernel"
_tf_keras_layer
і
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses
:	quantizer"
_tf_keras_layer
X
0
1
;2
<3
4
=5
>6
37"
trackable_list_wrapper
C
0
1
;2
<3
34"
trackable_list_wrapper
 "
trackable_list_wrapper
 
?non_trainable_variables

@layers
Ametrics
Blayer_regularization_losses
Clayer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
Ё
Dtrace_0
Etrace_1
Ftrace_2
Gtrace_32т
*__inference_cicada-v1_layer_call_fn_171247
*__inference_cicada-v1_layer_call_fn_171664
*__inference_cicada-v1_layer_call_fn_171685
*__inference_cicada-v1_layer_call_fn_171564њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zDtrace_0zEtrace_1zFtrace_2zGtrace_3
…
Htrace_0
Itrace_1
Jtrace_2
Ktrace_32ё
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171935
E__inference_cicada-v1_layer_call_and_return_conditional_losses_172217
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171589
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171614њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zHtrace_0zItrace_1zJtrace_2zKtrace_3
ћB…
!__inference__wrapped_model_170846inputs_"Ш
С≤Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ј
Liter

Mbeta_1

Nbeta_2
	Odecay
Plearning_ratemОmП3mР;mС<mТvУvФ3vХ;vЦ<vЧ"
	optimizer
,
Qserving_default"
signature_map
Q
0
1
;2
<3
4
=5
>6"
trackable_list_wrapper
<
0
1
;2
<3"
trackable_list_wrapper
 "
trackable_list_wrapper
≠
Rnon_trainable_variables

Slayers
Tmetrics
Ulayer_regularization_losses
Vlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
њ
Wtrace_0
Xtrace_12И
'__inference_dense1_layer_call_fn_172236
'__inference_dense1_layer_call_fn_172255≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zWtrace_0zXtrace_1
х
Ytrace_0
Ztrace_12Њ
B__inference_dense1_layer_call_and_return_conditional_losses_172377
B__inference_dense1_layer_call_and_return_conditional_losses_172524≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zYtrace_0zZtrace_1
"
_generic_user_object
"
_generic_user_object
.
0
1"
trackable_list_wrapper
к
[	variables
\trainable_variables
]regularization_losses
^	keras_api
___call__
*`&call_and_return_all_conditional_losses
aaxis
	;gamma
<beta
=moving_mean
>moving_variance"
_tf_keras_layer
 :	ь2dense1/kernel
:2dense1/bias
:	 2dense1/iteration
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≠
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses"
_generic_user_object
к
gtrace_02Ќ
&__inference_relu1_layer_call_fn_172529Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zgtrace_0
Е
htrace_02и
A__inference_relu1_layer_call_and_return_conditional_losses_172578Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zhtrace_0
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≠
inon_trainable_variables

jlayers
kmetrics
llayer_regularization_losses
mlayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses"
_generic_user_object
Ѕ
ntrace_0
otrace_12К
(__inference_dropout_layer_call_fn_172583
(__inference_dropout_layer_call_fn_172588≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zntrace_0zotrace_1
ч
ptrace_0
qtrace_12ј
C__inference_dropout_layer_call_and_return_conditional_losses_172593
C__inference_dropout_layer_call_and_return_conditional_losses_172605≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zptrace_0zqtrace_1
"
_generic_user_object
'
30"
trackable_list_wrapper
'
30"
trackable_list_wrapper
 "
trackable_list_wrapper
≠
rnon_trainable_variables

slayers
tmetrics
ulayer_regularization_losses
vlayer_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses"
_generic_user_object
л
wtrace_02ќ
'__inference_dense2_layer_call_fn_172612Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zwtrace_0
Ж
xtrace_02й
B__inference_dense2_layer_call_and_return_conditional_losses_172653Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zxtrace_0
"
_generic_user_object
'
10"
trackable_list_wrapper
:2dense2/kernel
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≠
ynon_trainable_variables

zlayers
{metrics
|layer_regularization_losses
}layer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses"
_generic_user_object
м
~trace_02ѕ
(__inference_outputs_layer_call_fn_172658Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z~trace_0
З
trace_02к
C__inference_outputs_layer_call_and_return_conditional_losses_172707Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 ztrace_0
"
_generic_user_object
.:,2 dense1/batch_normalization/gamma
-:+2dense1/batch_normalization/beta
6:4 (2&dense1/batch_normalization/moving_mean
::8 (2*dense1/batch_normalization/moving_variance
5
0
=1
>2"
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
(
А0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ьBщ
*__inference_cicada-v1_layer_call_fn_171247inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_cicada-v1_layer_call_fn_171664inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_cicada-v1_layer_call_fn_171685inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ьBщ
*__inference_cicada-v1_layer_call_fn_171564inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171935inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_172217inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЧBФ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171589inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЧBФ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171614inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
ЋB»
$__inference_signature_wrapper_171643inputs_"Ф
Н≤Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
5
0
=1
>2"
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
'__inference_dense1_layer_call_fn_172236inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
мBй
'__inference_dense1_layer_call_fn_172255inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЗBД
B__inference_dense1_layer_call_and_return_conditional_losses_172377inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЗBД
B__inference_dense1_layer_call_and_return_conditional_losses_172524inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
<
;0
<1
=2
>3"
trackable_list_wrapper
.
;0
<1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Бnon_trainable_variables
Вlayers
Гmetrics
 Дlayer_regularization_losses
Еlayer_metrics
[	variables
\trainable_variables
]regularization_losses
___call__
*`&call_and_return_all_conditional_losses
&`"call_and_return_conditional_losses"
_generic_user_object
Ё
Жtrace_0
Зtrace_12Ґ
4__inference_batch_normalization_layer_call_fn_172720
4__inference_batch_normalization_layer_call_fn_172733≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЖtrace_0zЗtrace_1
У
Иtrace_0
Йtrace_12Ў
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172753
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172787≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zИtrace_0zЙtrace_1
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
ЏB„
&__inference_relu1_layer_call_fn_172529inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
хBт
A__inference_relu1_layer_call_and_return_conditional_losses_172578inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
(__inference_dropout_layer_call_fn_172583inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
нBк
(__inference_dropout_layer_call_fn_172588inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ИBЕ
C__inference_dropout_layer_call_and_return_conditional_losses_172593inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ИBЕ
C__inference_dropout_layer_call_and_return_conditional_losses_172605inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
џBЎ
'__inference_dense2_layer_call_fn_172612inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense2_layer_call_and_return_conditional_losses_172653inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
№Bў
(__inference_outputs_layer_call_fn_172658inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
C__inference_outputs_layer_call_and_return_conditional_losses_172707inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
R
К	variables
Л	keras_api

Мtotal

Нcount"
_tf_keras_metric
.
=0
>1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
щBц
4__inference_batch_normalization_layer_call_fn_172720inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
щBц
4__inference_batch_normalization_layer_call_fn_172733inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ФBС
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172753inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ФBС
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172787inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
0
М0
Н1"
trackable_list_wrapper
.
К	variables"
_generic_user_object
:  (2total
:  (2count
%:#	ь2Adam/dense1/kernel/m
:2Adam/dense1/bias/m
$:"2Adam/dense2/kernel/m
3:12'Adam/dense1/batch_normalization/gamma/m
2:02&Adam/dense1/batch_normalization/beta/m
%:#	ь2Adam/dense1/kernel/v
:2Adam/dense1/bias/v
$:"2Adam/dense2/kernel/v
3:12'Adam/dense1/batch_normalization/gamma/v
2:02&Adam/dense1/batch_normalization/beta/vХ
!__inference__wrapped_model_170846p>;=<31Ґ.
'Ґ$
"К
inputs_€€€€€€€€€ь
™ "1™.
,
outputs!К
outputs€€€€€€€€€µ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172753b>;=<3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "%Ґ"
К
0€€€€€€€€€
Ъ µ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_172787b=>;<3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "%Ґ"
К
0€€€€€€€€€
Ъ Н
4__inference_batch_normalization_layer_call_fn_172720U>;=<3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "К€€€€€€€€€Н
4__inference_batch_normalization_layer_call_fn_172733U=>;<3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "К€€€€€€€€€µ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171589l>;=<39Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p 

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ µ
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171614l=>;<39Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ і
E__inference_cicada-v1_layer_call_and_return_conditional_losses_171935k>;=<38Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p 

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ і
E__inference_cicada-v1_layer_call_and_return_conditional_losses_172217k=>;<38Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ Н
*__inference_cicada-v1_layer_call_fn_171247_>;=<39Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p 

 
™ "К€€€€€€€€€Н
*__inference_cicada-v1_layer_call_fn_171564_=>;<39Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p

 
™ "К€€€€€€€€€М
*__inference_cicada-v1_layer_call_fn_171664^>;=<38Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p 

 
™ "К€€€€€€€€€М
*__inference_cicada-v1_layer_call_fn_171685^=>;<38Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p

 
™ "К€€€€€€€€€ђ
B__inference_dense1_layer_call_and_return_conditional_losses_172377f>;=<4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p 
™ "%Ґ"
К
0€€€€€€€€€
Ъ ђ
B__inference_dense1_layer_call_and_return_conditional_losses_172524f=>;<4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p
™ "%Ґ"
К
0€€€€€€€€€
Ъ Д
'__inference_dense1_layer_call_fn_172236Y>;=<4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p 
™ "К€€€€€€€€€Д
'__inference_dense1_layer_call_fn_172255Y=>;<4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p
™ "К€€€€€€€€€°
B__inference_dense2_layer_call_and_return_conditional_losses_172653[3/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "%Ґ"
К
0€€€€€€€€€
Ъ y
'__inference_dense2_layer_call_fn_172612N3/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "К€€€€€€€€€£
C__inference_dropout_layer_call_and_return_conditional_losses_172593\3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "%Ґ"
К
0€€€€€€€€€
Ъ £
C__inference_dropout_layer_call_and_return_conditional_losses_172605\3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "%Ґ"
К
0€€€€€€€€€
Ъ {
(__inference_dropout_layer_call_fn_172583O3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "К€€€€€€€€€{
(__inference_dropout_layer_call_fn_172588O3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "К€€€€€€€€€Я
C__inference_outputs_layer_call_and_return_conditional_losses_172707X/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "%Ґ"
К
0€€€€€€€€€
Ъ w
(__inference_outputs_layer_call_fn_172658K/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "К€€€€€€€€€Э
A__inference_relu1_layer_call_and_return_conditional_losses_172578X/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "%Ґ"
К
0€€€€€€€€€
Ъ u
&__inference_relu1_layer_call_fn_172529K/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "К€€€€€€€€€£
$__inference_signature_wrapper_171643{>;=<3<Ґ9
Ґ 
2™/
-
inputs_"К
inputs_€€€€€€€€€ь"1™.
,
outputs!К
outputs€€€€€€€€€