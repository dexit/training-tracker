<?php
/* @var $this ExerciseController */
/* @var $dataProvider CActiveDataProvider */
?>

<?php
$this->breadcrumbs=array(
	'Exercises',
);

$this->menu=array(
	array('label'=>'Create Exercise','url'=>array('create')),
	array('label'=>'Manage Exercise','url'=>array('admin')),
);
?>

<h1>Exercises</h1>

<?php 
$this->widget('bootstrap.widgets.TbGridView',array(
		'id'=>'exercise-grid',
		'dataProvider'=>$dataProvider,
		'columns'=>array(
				'id',
				'name',
		),
));
 ?>