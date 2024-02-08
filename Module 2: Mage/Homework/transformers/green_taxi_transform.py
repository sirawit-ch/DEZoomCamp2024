import pandas as pd
if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    data = data[(data['passenger_count'] != 0) & (data['trip_distance']) != 0]
    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date
    data.columns = (data.columns
                    .str.replace(' ', '_')
                    .str.lower()
                    .str.replace('vendorid','vendor_id')
                    .str.replace('ratecodeid','ratecode_id')
                    .str.replace('pulocationid','pu_location_id')
                    .str.replace('dolocationid','do_location_id')
    )
    return data


@test
def test_output(output, *args) -> None:
    assert output['vendor_id'].isin([1,2]).sum() > 0, 'There are rides with zero passengers'
    assert output['passenger_count'].isin([0]).sum() == 0, 'There are rides with zero passengers'
    assert output['trip_distance'].isin([0]).sum() == 0, 'There are 0 trip distance'
