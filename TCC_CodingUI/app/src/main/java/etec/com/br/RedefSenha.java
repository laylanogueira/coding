package etec.com.br;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class RedefSenha extends AppCompatActivity {

    private Button Avancar;
    private EditText editRedef;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_redef_senha);

        Avancar = findViewById(R.id.btnAvancar);
        Avancar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Entrar(v);
            }
        });

        editRedef = findViewById(R.id.editRedef);
        editRedef.addTextChangedListener(Redefinicao);

    }

    private TextWatcher Redefinicao = new TextWatcher() {
        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {

        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
            String RedefInput = editRedef.getText().toString().trim();

            Avancar.setEnabled(!RedefInput.isEmpty());

            if (RedefInput.isEmpty()){
                Avancar.setBackground(getResources().getDrawable(R.drawable.btndisable));
                Avancar.setTextColor(getResources().getColor(R.color.colorHint));
            } else {
                Avancar.setBackground(getResources().getDrawable(R.drawable.arredondarbuttoncadastrar));
                Avancar.setTextColor(getResources().getColor(R.color.colorFontCoding));
            }

        }

        @Override
        public void afterTextChanged(Editable s) {

        }
    };

    public void Entrar (View v)
    {
        Toast.makeText(getApplication(),"Enviamos um email para "+editRedef.getText().toString()+"um link para redefinição de senha",Toast.LENGTH_SHORT).show();
    }
}
