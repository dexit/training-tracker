<?php
/* @var $this ExerciseController */
/* @var $model Exercise */


$this->widget('bootstrap.widgets.BsBreadcrumb', array(
    'links' => array(
        'Exercises' => 'index',
        'Manage'
    )
));


$this->menu = array(

    array('label' => 'Create Exercise', 'url' => array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#exercise-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

    <h1>Manage Exercises</h1>



<?php echo CHtml::link('Advanced Search', '#', array('class' => 'search-button btn')); ?>
    <div class="search-form" style="display:none">
        <?php $this->renderPartial('_search', array(
            'model' => $model,
        )); ?>
    </div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.BsGridView', array(
    'id' => 'exercise-grid',
    'dataProvider' => $model->search(),
    'type' => BsHtml::GRID_TYPE_STRIPED,
    'filter' => $model,
    'columns' => array(
        //'id',
        'name',
        array(
            'class' => 'bootstrap.widgets.BsButtonColumn',
        ),
    ),
)); ?>