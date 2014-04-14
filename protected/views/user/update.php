<?php
/* @var $this UserController */
/* @var $model User */
?>

<?php

$this->widget ( 'bootstrap.widgets.BsBreadcrumb', array (
		'links' => array (
				'Users' => 'index',
				$model->username => array (
						'view',
						'id' => $model->id
				),
				'Update'
		)
) );

$this->menu=array(
	
	array('label'=>'Create User', 'url'=>array('create')),
	array('label'=>'View User', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage User', 'url'=>array('admin')),
);
?>

    <h1>Update User <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>